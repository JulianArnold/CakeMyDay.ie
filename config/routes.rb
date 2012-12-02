CakeMyDaySite::Application.routes.draw do

  # special routes for the online store
  match "store"    => "store#index",           :as => :store
  match "store/:product_name" => "store#show", :as => :store_product
  match 'search'   => 'store#search',          :as => :search, :method => :post
  
  # special routes for user authentication
  match 'login'    => "user_sessions#new",     :as => :login
  match 'log_in'   => "user_sessions#new",     :as => :log_in
  match 'signin'   => "user_sessions#new",     :as => :signin
  match 'sign_in'  => "user_sessions#new",     :as => :sign_in
  match 'logout'   => "user_sessions#destroy", :as => :logout
  match 'account'  => 'users#show',            :as => :account
  match 'my_account'  => 'users#show',         :as => :my_account
  match 'signup'   => 'users#new',             :as => :signup
  match 'sign_up'  => 'users#new',             :as => :sign_up
  match 'register' => 'users#new',             :as => :register

  # special routes for miscellaneous purposes
  match 'link_finished_product_image' => 'finished_products#link_image', :as => :link_finished_product_image
  
  resources :currencies
  resources :customers
  resources :finished_products
  resources :general_settings
  resources :images
  resources :options_lists
  resources :pay_pal_statuses
  resources :pay_pal_transactions
  resources :products #do
#    member do
#      get 'search'
#    end
#  end
  resources :product_categories
  resources :product_components
  resources :product_images
  resources :product_prices
  resources :production_quota
  resources :shopping_carts
  resources :shopping_cart_items
  resources :shopping_cart_statuses
  resources :special_occasions
  resources :static_pages
  resources :users
  resources :user_groups
  resources :user_sessions

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'store#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  
  # deal with static page requests
  match '/:page', :controller => :static_pages, :action => :display
  
end
