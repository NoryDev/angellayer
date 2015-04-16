ActiveAdmin.register Vote do
  permit_params :plus, :minus, :evaluation_id, :founder_id

  index do
    selectable_column
    id_column
    column :plus
    column :minus
    column :evaluation_id
    column :founder_id
    actions
  end

  filter :plus
  filter :minus
  filter :evaluation_id
  filter :founder_id

  form do |f|
    f.inputs "Admin Details" do
      f.input :plus
      f.input :minus
      f.input :evaluation_id
      f.input :founder_id
    end
    f.actions
  end
end