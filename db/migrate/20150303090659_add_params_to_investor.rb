class AddParamsToInvestor < ActiveRecord::Migration
  def change
    add_column :investors, :company_name, :string
    add_column :investors, :physical_address, :text
    add_column :investors, :phone_number, :text
    add_column :investors, :facebook, :string
    add_column :investors, :twitter, :string
    add_column :investors, :linkedin, :string
    add_column :investors, :angellist, :string
    add_column :investors, :skype, :string
    add_column :investors, :website, :string
    add_column :investors, :sectors_invested_in, :text
    add_column :investors, :capital_under_managment, :integer
    add_column :investors, :geographical_focus, :text
    add_column :investors, :preferred_investment_stage, :string
    add_column :investors, :nb_projects_invested_in, :integer
    add_column :investors, :contact_person, :string
    add_column :investors, :contact_email, :string
    add_column :investors, :contact_cell_phone, :string
  end
end
