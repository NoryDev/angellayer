class Evaluation < ActiveRecord::Base
  belongs_to :investor
  belongs_to :founder

  def average_score
    if rating_reputation.nil? || rating_deal.nil? || rating_pitch.nil? || rating_competence.nil? || rating_commitment.nil?
      nil
    else
      (rating_reputation + rating_deal + rating_pitch + rating_competence + rating_commitment)/5
    end
  end

  def work_again
    if would_work_again == true
      "I'd work again with this investor"
    else
      "I wouldn't want to work with this investor in the futur."
    end
  end

  def date
    created_at.strftime("%Y-%m-%d")
  end
end
