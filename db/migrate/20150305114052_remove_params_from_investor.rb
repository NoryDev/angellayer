class RemoveParamsFromInvestor < ActiveRecord::Migration
  def change
    remove_column :investors, :company_name, :string
    remove_column :investors, :physical_address, :text
    remove_column :investors, :phone_number, :text
    remove_column :investors, :facebook, :string
    remove_column :investors, :twitter, :string
    remove_column :investors, :linkedin, :string
    remove_column :investors, :angellist, :string
    remove_column :investors, :skype, :string
    remove_column :investors, :website, :string
    remove_column :investors, :sectors_invested_in, :text
    remove_column :investors, :capital_under_managment, :integer
    remove_column :investors, :geographical_focus, :text
    remove_column :investors, :preferred_investment_stage, :string
    remove_column :investors, :nb_projects_invested_in, :integer
    remove_column :investors, :contact_person, :string
    remove_column :investors, :contact_email, :string
    remove_column :investors, :contact_cell_phone, :string
  end
end
