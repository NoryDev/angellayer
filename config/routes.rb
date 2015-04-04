Rails.application.routes.draw do

  post 'contacts/send_contact'

  ActiveAdmin.routes(self)

  namespace :founders do
    resources :profile, only: [:index, :show, :edit, :update]
  end

  namespace :investors do
    resources :profile, only: [:index, :show, :edit, :update, :new, :create]
  end

  get 'investors/profile/:investor_id/evaluations/new' => "evaluations#new", as: :new_investors_profile_evaluation
  post 'investors/profile/:investor_id/evaluations' => "evaluations#create", as: :investors_profile_evaluations

  get 'investors/profile/:investor_id/evaluations/:id/edit' => "evaluations#edit", as: :edit_investors_profile_evaluation

  patch 'investors/profile/:investor_id/evaluations/:id' => "evaluations#update", as: :investors_profile_evaluation

  resources :evaluations, except: [:new, :edit, :create, :update] do
    resources :comments, only: [:new, :create, :edit, :update]
    get '/upvote' => "votes#upvote", as: :upvote
    get '/downvote' => "votes#downvote", as: :downvote
  end

  devise_for :investors
  devise_for :founders, controllers: { omniauth_callbacks: "founders/omniauth_callbacks" }


  get 'founders/profile/:founder_id/dashboard' => "welcome#dashboard", as: :founder_profile_dashboard

  # Home: forms managment
  post '/sign_up' => "welcome#sign_up"
  post '/log_in' => "welcome#log_in"

  #search bar
  get '/search' => "welcome#search"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
