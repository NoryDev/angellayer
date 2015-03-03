class Evaluation < ActiveRecord::Base
  belongs_to :investor
  belongs_to :founder

  def average_score
    (rating_reputation + rating_deal + rating_pitch + rating_competence + rating_commitment)/5
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
