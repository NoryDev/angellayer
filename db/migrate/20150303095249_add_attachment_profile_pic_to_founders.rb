class AddAttachmentProfilePicToFounders < ActiveRecord::Migration
  def self.up
    change_table :founders do |t|
      t.attachment :profile_pic
    end
  end

  def self.down
    remove_attachment :founders, :profile_pic
  end
end
