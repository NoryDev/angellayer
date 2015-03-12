class AddAverageScoreToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :average_score, :float
  end
end
