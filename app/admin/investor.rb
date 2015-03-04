ActiveAdmin.register Investor do
  permit_params :company_name, :physical_address, :phone_number, :facebook, :twitter, :linkedin, :angellist, :skype, :cell_phone, :website, :contact_person, :contact_cell_phone, :sectors_invested_in, :capital_under_managment, :geographical_focus, :preferred_investment_stage, :nb_projects_invested_in, :profile_pic


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
