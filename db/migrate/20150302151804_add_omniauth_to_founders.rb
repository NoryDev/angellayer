class AddOmniauthToFounders < ActiveRecord::Migration
  def change
    add_column :founders, :provider, :string
    add_column :founders, :uid, :string
    add_column :founders, :picture, :string
    add_column :founders, :name, :string
    add_column :founders, :token, :string
    add_column :founders, :token_expiry, :datetime
  end
end
