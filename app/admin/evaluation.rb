ActiveAdmin.register Evaluation do
  permit_params :investor_profile_id, :founder_id, :review, :average_score, :rating_reputation,
  :rating_deal, :rating_pitch, :rating_competence, :rating_commitment, :amount_raised,
  :would_work_again, :title_review


  index do
    selectable_column
    id_column
    column :investor_profile_id
    column :founder_id
    column :title_review
    column :average_score
    # column :current_sign_in_at
    # column :sign_in_count
    # column :created_at
    actions
  end

  filter :investor_profile_id
  filter :founder_id
  filter :title_review
  filter :average_score
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :investor_profile_id
      f.input :founder_id
      f.input :title_review
      f.input :review
      f.input :rating_reputation
      f.input :rating_deal
      f.input :rating_pitch
      f.input :rating_competence
      f.input :rating_commitment
      f.input :amount_raised
      f.input :would_work_again
    end
    f.actions
  end
end