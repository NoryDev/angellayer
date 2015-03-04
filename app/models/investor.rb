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

  def rating(area)
    ratings = evaluations.map { |evaluation| evaluation.send("rating_#{area}") }
    ratings = ratings.reject{ |rating| rating.nil? }
    if ratings.empty?
      nil
    else
      ratings.reduce(:+)/ratings.size
    end
  end

  def nb_of_rates
    scores = evaluations.map{ |evaluation| evaluation.average_score }
    scores = scores.reject{ |score| score.nil? }
    scores.size
  end

  def total_average_score
    scores = evaluations.map{ |evaluation| evaluation.average_score }
    scores = scores.reject{ |score| score.nil? }
    if scores.empty?
      nil
    else
      average = scores.reduce(:+)/scores.size
      average.round(1)
    end
  end
end
