class AddAttachmentProfilePicToInvestors < ActiveRecord::Migration
  def self.up
    change_table :investors do |t|
      t.attachment :profile_pic
    end
  end

  def self.down
    remove_attachment :investors, :profile_pic
  end
end
