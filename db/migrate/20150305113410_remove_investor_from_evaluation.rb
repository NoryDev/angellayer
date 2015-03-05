class RemoveInvestorFromEvaluation < ActiveRecord::Migration
  def change
    remove_reference :evaluations, :investor, index: true
  end
end
