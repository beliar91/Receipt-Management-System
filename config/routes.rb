Rails.application.routes.draw do

  #
  # get 'static_pages/privacy_policy'
  #
  # get 'static_pages/faq'
  #
  # get 'static_pages/about_us'

  #get ':id', to: 'static_pages#show', as: :static_page

  ActiveAdmin.routes(self)
  get 'shop_searches/new'

  get 'shop_searches/show'

  resources :shops

  resources :receipts do
    resources :articles
  end

  resources :complaints

  resources :static_pages

  devise_for :users #, :skip => [:sessions]

  # as :user do
  #   get '/' => 'home#index', :as => :new_user_session
  #   post '/' => 'devise/sessions#create', :as => :user_session
  #   post '/' => 'devise/registrations#create', :as => :user_reg
  #   get 'sign_out' => 'devise/sessions#destroy', :as => :destroy_user_session
  # end






  resources :dashboard


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'home#index'

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
