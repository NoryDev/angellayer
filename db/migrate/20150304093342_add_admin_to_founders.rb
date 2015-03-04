class AddAdminToFounders < ActiveRecord::Migration
  def change
    add_column :founders, :admin, :boolean, null: false, default: false
  end
end
