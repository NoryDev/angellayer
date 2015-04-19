class AddTotalAverageScoreToInvestorProfile < ActiveRecord::Migration
  def change
    add_column :investor_profiles, :total_average_score, :float
  end
end
