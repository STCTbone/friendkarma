FriendKarma::Application.routes.draw do

  resources :invitations


  get "oauths/oauth"
  get "/dashboard" => "dashboard#index", as: 'dashboard'
  post "/dashboard" => "dashboard#destroy", as: 'dashboard'

  get "oauths/callback"

  resources :password_resets

  root to: 'user_sessions#new'

  resources :users do

    member do
      get :activate
    end
  end

  resources :memberships

  resources :comments

  resources :requests

  get "/requests/:id/complete" => 'requests#completed_job', as: :completed_request
  get "/requests/:id/accepted" => 'requests#accepted', as: :request_accepted

  resources :jobs

  get "/jobs/:id/complete" => 'jobs#completed_job', as: :completed_job
  get "/jobs/:id/accepted" => 'jobs#accepted', as: :job_accepted

  resources :groups

  resources :user_sessions

  match 'login' => 'user_sessions#new', as: :login
  match 'logout' => 'user_sessions#destroy', as: :logout

  match "oauth/callback" => "oauths#callback"
  match "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

#  post '/sms/' => 'sms_receive#index', as: :sms_receive

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
