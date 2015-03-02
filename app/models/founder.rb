class Founder < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [ :facebook ]

  has_many :evaluations

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
    first_name + " " + last_name
  end
end
