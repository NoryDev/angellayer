class AddAttachmentProfilePicToInvestorProfiles < ActiveRecord::Migration
  def self.up
    change_table :investor_profiles do |t|
      t.attachment :profile_pic
    end
  end

  def self.down
    remove_attachment :investor_profiles, :profile_pic
  end
end
