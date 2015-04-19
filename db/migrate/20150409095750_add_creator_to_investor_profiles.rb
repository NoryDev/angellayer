class AddCreatorToInvestorProfiles < ActiveRecord::Migration
  def change
    add_column :investor_profiles, :author_as_founder_id, :integer
    add_column :investor_profiles, :author_as_investor_id, :integer
    add_column :investor_profiles, :author_is_founder, :boolean
  end
end
