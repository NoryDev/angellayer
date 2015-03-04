class CreateInvestorProfiles < ActiveRecord::Migration
  def change
    create_table :investor_profiles do |t|
      t.string :email
      t.string :company_name
      t.text :physical_address
      t.string :phone_number
      t.string :facebook
      t.string :twitter
      t.string :linkedin
      t.string :angellist
      t.string :skype
      t.string :website
      t.text :sectors_invested_in
      t.integer :capital_under_managment
      t.text :geographical_focus
      t.string :preferred_investment_stage
      t.integer :nb_projects_invested_in
      t.string :contact_person
      t.string :contact_email
      t.string :contact_cell_phone
      t.references :investor, index: true

      t.timestamps null: false
    end
    add_foreign_key :investor_profiles, :investors
  end
end
