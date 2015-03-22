class Founder < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:first_name, :last_name, :all_startups]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [ :facebook, :twitter, :linkedin ]

  has_many :evaluations
  has_many :comments
  has_many :votes

  validates :email, presence: true

  has_attached_file :profile_pic,
    styles: { medium: "300x300#", thumb: "100x100#" },
    :default_url => "default_founder_picture.svg"

  validates_attachment_content_type :profile_pic,
    content_type: /\Aimage\/.*\z/

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |founder|
      founder.provider = auth.provider
      founder.uid = auth.uid
      founder.email = auth.info.email
      founder.password = Devise.friendly_token[0,20]  # Fake password for validation
      founder.first_name = auth.info.first_name
      founder.last_name = auth.info.last_name
      founder.picture = auth.info.image
      founder.facebook = "www.facebook.com/#{auth.uid}"
      founder.token = auth.credentials.token
      founder.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end

  def self.find_for_twitter_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |founder|
      founder.provider = auth.provider
      founder.uid = auth.uid
      founder.email = "#{auth.info.nickname}@example.com"
      founder.password = Devise.friendly_token[0,20]  # Fake password for validation
      founder.first_name = auth.info.name.split(' ').first
      founder.last_name = auth.info.name.split(' ').last
      founder.picture = auth.info.image.gsub(/_normal/, '')
      founder.twitter = auth.info.urls.Twitter
      founder.website = auth.info.urls.Website
      founder.token = auth.credentials.token
    end
  end

  def self.connect_to_linkedin(auth, signed_in_resource=nil)
    founder = Founder.where(:provider => auth.provider, :uid => auth.uid).first
    if founder
      return founder
    else
      registered_founder = Founder.where(:email => auth.info.email).first
      if registered_founder
        return registered_founder
      else
        founder = Founder.create(
          provider:auth.provider,
          uid:auth.uid,
          email:auth.info.email,
          password:Devise.friendly_token[0,20],
          first_name: auth.info.first_name,
          last_name: auth.info.last_name,
          picture: auth.info.image,
          linkedin: auth.info.urls.public_profile,
          token: auth.credentials.token
          )
      end
    end
  end

  def name
    [first_name, last_name].reject(&:blank?).join(' ')
  end

  def image
    if profile_pic.file? || picture.nil?
      profile_pic.url(:medium)
    else
      "#{picture}?type=large"
    end
  end

  def avatar
    if profile_pic.file? || picture.nil?
      profile_pic.url(:thumb)
    else
      "#{picture}?type=square"
    end
  end

  def to_s
    name
  end
end
