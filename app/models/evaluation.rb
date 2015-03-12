class Evaluation < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:review, :title_review]

  belongs_to :founder
  belongs_to :investor_profile

  has_many :comments
  has_many :votes

  validates :investor_profile, :founder, :review, :title_review, presence: true

  before_save :set_average_score

  #default_scope { order('created_at DESC') }


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

  def score
    pluses  = votes.where(plus: true).size
    minuses = votes.where(minus: true).size
    pluses - minuses
  end

  private

    def set_average_score
      self.average_score = get_average_score
    end

    def get_average_score
      rates = [rating_reputation, rating_deal, rating_pitch, rating_competence, rating_commitment]
      rates = rates.reject{ |rate| rate.nil? }
      rate_sum = rates.reduce(:+)
      if rates.empty?
        nil
      else
        rate_sum / rates.size
      end
    end
end
