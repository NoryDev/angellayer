class AddInvestorProfileToEvaluation < ActiveRecord::Migration
  def change
    add_reference :evaluations, :investor_profile, index: true
    add_foreign_key :evaluations, :investor_profiles
  end
end
