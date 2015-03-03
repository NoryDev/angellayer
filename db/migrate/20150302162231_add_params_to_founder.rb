class AddParamsToFounder < ActiveRecord::Migration
  def change
    remove_column :founders, :name, :string
    add_column :founders, :first_name, :string
    add_column :founders, :last_name, :string
    add_column :founders, :facebook, :string
    add_column :founders, :twitter, :string
    add_column :founders, :linkedin, :string
    add_column :founders, :angellist, :string
    add_column :founders, :skype, :string
    add_column :founders, :cell_phone, :string
    add_column :founders, :website, :string
    add_column :founders, :all_startups, :text
  end
end
