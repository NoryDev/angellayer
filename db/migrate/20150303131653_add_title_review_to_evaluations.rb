class AddTitleReviewToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :title_review, :string
  end
end
