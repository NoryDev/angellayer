class Founder < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:first_name, :last_name, :all_startups]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [ :facebook, :twitter ]

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

  def name
    "#{first_name} #{last_name}"
  end

  def image
    if profile_pic.file? || picture.nil?
      return profile_pic.url(:medium)
    else
      return "#{picture}?type=large"
    end
  end

  def avatar
    if profile_pic.file? || picture.nil?
      return profile_pic.url(:thumb)
    else
      return "#{picture}?type=square"
    end
  end

  def to_s
    name
  end
end
