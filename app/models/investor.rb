class Investor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         # :omniauthable, :omniauth_providers => [ :facebook ]

  has_many :evaluations

  has_attached_file :profile_pic,
    styles: { medium: "300x300#", thumb: "100x100#" },
    :default_url => "default_investor_picture.svg"

  validates_attachment_content_type :profile_pic,
    content_type: /\Aimage\/.*\z/

  def image
    profile_pic.url(:medium)
  end

  def avatar
    profile_pic.url(:thumb)
  end

  def to_s
    company_name
  end

  def self.total_average_score(evaluations)
    average_total = 0
    number_of_rates = 0
    evaluations.each do |evaluation|
      average_total += Evaluation.average_score(evaluation)
      number_of_rates +=1
    end
    "Rated #{(average_total / number_of_rates).round(1)} / 5 by #{number_of_rates} founders"
  end

end
