class Founder < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [ :facebook ]

  has_many :evaluations

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
      founder.token = auth.credentials.token
      founder.token_expiry = Time.at(auth.credentials.expires_at)
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
