class Investor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         # :omniauthable, :omniauth_providers => [ :facebook ]

  has_one :investor_profile

  has_many :investor_profiles_author, :class_name => "InvestorProfile", :foreign_key => "author_as_investor_id"
end
