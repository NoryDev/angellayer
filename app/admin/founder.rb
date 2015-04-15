ActiveAdmin.register Founder do
  permit_params :email, :password, :password_confirmation, :first_name, :last_name,
  :facebook, :twitter, :linkedin, :angellist, :skype, :cell_phone, :website, :all_startups

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    # column :current_sign_in_at
    # column :sign_in_count
    # column :created_at
    actions
  end

  filter :email
  filter :first_name
  filter :last_name
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :admin
      f.input :first_name
      f.input :last_name
      f.input :picture
      f.input :profile_pic_file_name
      f.input :profile_pic_content_type
      f.input :profile_pic_file_size
      f.input :facebook
      f.input :twitter
      f.input :linkedin
      f.input :angellist
      f.input :skype
      f.input :cell_phone
      f.input :website
      f.input :all_startups
    end
    f.actions
  end

end
