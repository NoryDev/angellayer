class InvestorProfile < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:company_name, :physical_address, :sectors_invested_in, :geographical_focus, :preferred_investment_stage, :contact_person]

  belongs_to :investor

  has_many :evaluations, dependent: :destroy

  has_attached_file :profile_pic,
    styles: { medium: "300x300#", thumb: "100x100#" },
    :default_url => "default_investor_picture.svg"

  validates_attachment_content_type :profile_pic,
    content_type: /\Aimage\/.*\z/

  after_create :send_welcome_email

  before_save :set_total_average_score

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
    nb_rates = evaluations.map{ |evaluation| evaluation.average_score }
    nb_rates = nb_rates.reject{ |nb_rate| nb_rate.nil? }
    nb_rates.size
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

  private

  def send_welcome_email
    InvestorMailer.welcome(self).deliver
  end
end
