ActiveAdmin.register Comment, :as => "Founder Comments" do
  permit_params :content, :evaluation_id, :founder_id

  index do
    selectable_column
    id_column
    column :content
    column :evaluation_id
    column :founder_id
    actions
  end

  filter :content
  filter :evaluation_id
  filter :founder_id

  form do |f|
    f.inputs "Admin Details" do
      f.input :content
      f.input :evaluation_id
      f.input :founder_id
    end
    f.actions
  end
end