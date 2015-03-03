class Evaluation < ActiveRecord::Base
  belongs_to :investor
  belongs_to :founder

  def self.average_score(evaluation)
    (evaluation.rating_reputation + evaluation.rating_deal + evaluation.rating_pitch + evaluation.rating_competence + evaluation.rating_commitment)/5
  end

    def self.work_again(would_work_again)
    if would_work_again == true
      "I'd work again with this investor"
    else
      "I wouldn't want to work with this investor in the futur."
    end
  end

end
