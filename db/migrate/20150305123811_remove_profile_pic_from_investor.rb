class RemoveProfilePicFromInvestor < ActiveRecord::Migration
  def self.up
    remove_attachment :investors, :profile_pic
  end

  def self.down
    change_table :investors do |t|
      t.attachment :profile_pic
    end
  end
end


