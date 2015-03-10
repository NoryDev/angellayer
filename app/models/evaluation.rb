class Evaluation < ActiveRecord::Base
  belongs_to :founder
  belongs_to :investor_profile

  has_many :comments
  has_many :votes

  validates :investor_profile, :founder, :review, :title_review, presence: true

  def average_score
    rates = [rating_reputation, rating_deal, rating_pitch, rating_competence, rating_commitment]
    rates = rates.reject{ |rate| rate.nil? }
    rate_sum = rates.reduce(:+)
    if rates.empty?
      nil
    else
      rate_sum / rates.size
    end
  end

  def best_comments

  end

  def work_again
    if would_work_again == true
      "I would work with this investor again"
    elsif would_work_again == false
      "I would not work with this investor again"
    else
      ""
    end
  end

  def date
    created_at.strftime("%Y-%m-%d")
  end

  def score
    pluses = votes.where(plus: true).size
    minuses = votes.where(minus: true).size
    pluses - minuses
  end
end
