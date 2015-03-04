Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # namespace :investors do
  # get 'profile/index'
  # end

  # namespace :investors do
  # get 'profile/show'
  # end

  # namespace :investors do
  # get 'profile/edit'
  # end

  # namespace :investors do
  # get 'profile/update'
  # end

  # namespace :founders do
  #   get '/' => "profiles#index"
  # end

  # namespace :founders do
  #   get '/:id' => "profiles#show", as: :founder_profile
  # end

  # namespace :founders do
  # get '/new' => "profiles#new", as: :new_founder_profile
  # end

  # namespace :founders do
  # get '/:id/edit' => "profiles#edit", as: :edit_founder_profile
  # end

  # namespace :founders do
  # post '/' => "profiles#create"
  # end

  # namespace :founders do
  # patch '/:id' => "profiles#update"
  # put '/:id' => "profiles#update"
  # end

  # namespace :founders do
  # delete '/:id' => "profiles#destroy"
  # end

  namespace :founders do
    resources :profile, only: [:index, :show, :edit, :update]
  end

  namespace :investors do
    resources :profile, only: [:index, :show, :edit, :update]
  end

  get 'investors/profile/:investor_id/evaluations/new' => "evaluations#new", as: :new_investors_profile_evaluation
  post 'investors/profile/:investor_id/evaluations/create' => "evaluations#create", as: :investors_profile_evaluations

  # scope module: 'founders' do
  #   resources :profiles
  # end

  get 'welcome/index'

  resources :evaluations, except: [:new]


  devise_for :investors
  devise_for :founders, controllers: { omniauth_callbacks: "founders/omniauth_callbacks" }


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
