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
    end
    f.actions
  end

end
