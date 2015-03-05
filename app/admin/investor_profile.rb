ActiveAdmin.register InvestorProfile do
  permit_params :email, :company_name, :investor_id, :physical_address, :phone_number,
  :facebook, :twitter, :linkedin, :angellist, :skype, :phone_number, :website,
  :contact_person, :contact_cell_phone, :sectors_invested_in, :capital_under_managment,
  :geographical_focus, :preferred_investment_stage, :nb_projects_invested_in, :profile_pic

  index do
    selectable_column
    id_column
    column :company_name
    column :email
    column :investor_id
    # column :current_sign_in_at
    # column :sign_in_count
    # column :created_at
    actions
  end

  filter :company_name
  filter :email
  filter :investor_id
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :company_name
      f.input :investor_id
      f.input :physical_address
      f.input :phone_number
      f.input :facebook
      f.input :twitter
      f.input :linkedin
      f.input :angellist
      f.input :skype
      f.input :phone_number
      f.input :website
      f.input :contact_person
      f.input :contact_cell_phone
      f.input :sectors_invested_in
      f.input :capital_under_managment
      f.input :geographical_focus
      f.input :preferred_investment_stage
      f.input :nb_projects_invested_in
    end
    f.actions
  end


end