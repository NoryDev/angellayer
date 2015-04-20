class Evaluation < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:review, :title_review]

  belongs_to :founder
  belongs_to :investor_profile

  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :investor_profile, :founder, :review, :title_review, presence: true

  before_save :set_average_score
  after_save :set_total_average_score

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

  def star_score(score)
    stars = "".html_safe
    if score.nil?
      5.times do
        stars << '<i class="fa fa-star-o"></i>'.html_safe
        #not very clean but only technique that worked...
      end
    else
      stars_used = 0
      score.to_i.times do
        stars << '<i class="fa fa-star"></i>'.html_safe
      end
      stars_used = score.to_i
      if score - score.to_i >= 0.5
        stars << "<i class='fa fa-star-half-o'></i>".html_safe
        stars_used += 1
      end
      empty = 5 - stars_used
      empty.times do
        stars << "<i class='fa fa-star-o'></i>".html_safe
      end
    end
    stars
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

    def set_total_average_score
      self.investor_profile.total_average_score = get_total_average_score(self.investor_profile)
      self.investor_profile.save
    end

    def get_total_average_score(investor_profile)
    scores = investor_profile.evaluations.map{ |evaluation| evaluation.average_score }
    scores = scores.reject{ |score| score.nil? }
      if scores.empty?
        nil
      else
        average = scores.reduce(:+)/scores.size
        average.round(1)
      end
    end

end
