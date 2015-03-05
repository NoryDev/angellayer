class Evaluation < ActiveRecord::Base
  belongs_to :founder
  has_many :comments
  validates :investor_profile, :founder, :review, :title_review, presence: true
  belongs_to :investor_profile



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

  def work_again
    if would_work_again == true
      "I'd work again with this investor |"
    elsif would_work_again == false
      "I wouldn't want to work with this investor in the futur. |"
    else

    end
  end

  def date
    created_at.strftime("%Y-%m-%d")
  end
end
