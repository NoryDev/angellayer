class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.references :investor_profile, index: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :job_title
      t.string :speciality
      t.integer :year_joined
      t.string :facebook
      t.string :twitter
      t.string :angellist
      t.string :skype
      t.string :linkedin

      t.timestamps null: false
    end
    add_foreign_key :team_members, :investor_profiles
  end
end
