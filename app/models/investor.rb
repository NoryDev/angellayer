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

  def rating_reputation
    ratings = evaluations.map { |evaluation| evaluation.rating_reputation }
    if ratings.empty?
      "not rated yet"
    else
      ratings.reduce(:+)/ratings.size
    end
  end

  def rating_deal
    ratings = evaluations.map { |evaluation| evaluation.rating_deal }
    if ratings.empty?
      "not rated yet"
    else
      ratings.reduce(:+)/ratings.size
    end
  end

  def rating_pitch
    ratings = evaluations.map { |evaluation| evaluation.rating_pitch }
    if ratings.empty?
      "not rated yet"
    else
      ratings.reduce(:+)/ratings.size
    end
  end

  def rating_competence
    ratings = evaluations.map { |evaluation| evaluation.rating_competence }
    if ratings.empty?
      "not rated yet"
    else
      ratings.reduce(:+)/ratings.size
    end
  end

  def rating_commitment
    ratings = evaluations.map { |evaluation| evaluation.rating_commitment }
    if ratings.empty?
      "not rated yet"
    else
      ratings.reduce(:+)/ratings.size
    end
  end

  def nb_of_rates
    evaluations.size
  end

  def total_average_score
    average_total = 0
    number_of_rates = 0
    evaluations.each do |evaluation|
      average_total += evaluation.average_score
      number_of_rates +=1
    end
    if number_of_rates == 0
      "No rating"
    else
      (average_total / number_of_rates).round(1)
    end
  end
end
