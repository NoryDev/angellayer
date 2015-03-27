class AddConfirmableToDevise < ActiveRecord::Migration
  def up
    add_column :founders, :confirmation_token, :string
    add_column :founders, :confirmed_at, :datetime
    add_column :founders, :confirmation_sent_at, :datetime
    # add_column :founders, :unconfirmed_email, :string # Only if using reconfirmable
    add_index :founders, :confirmation_token, unique: true
    # User.reset_column_information # Need for some types of updates, but not for update_all.
    # To avoid a short time window between running the migration and updating all existing
    # founders as confirmed, do the following
    execute("UPDATE founders SET confirmed_at = NOW()")
    # All existing user accounts should be able to log in after this.
  end

  def down
    remove_columns :founders, :confirmation_token, :confirmed_at, :confirmation_sent_at
    # remove_columns :founders, :unconfirmed_email # Only if using reconfirmable
  end
end
