Sqlservapp::Application.routes.draw do


  resources :activity_logs
  resources :issues
  resources :invoices
  resources :depreciations
  resources :accruals
  match 'compute_accruals', :to => 'accruals#compute_accruals', :as => "compute_accruals"


  # match 'cars/list', :to => 'catalog#list'
  match 'list', :to => 'cars#list', :as => "list"
  match 'sp', :to => 'cars#sp', :as => "sp"





   #  Authentication and roles
  resources :users, :user_sessions
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout

  resource :account, :controller => "users"
  root :controller => "user_sessions", :action => "new"
  resources :roles

  resources :report_categories
  match 'report_categories/:id' => 'report_category#show'
  resources :report_categories, :collection => { :prioritize_reports => :post }

  resources :reports
  resources :reports, :collection => { :prioritize_report_lines => :post }

  resources :report_lines
  resources :account_plans

  resources :menus
  resources :projects
  resources :tasklists , :has_many => [ :comments ]
  resources :comments

  resources :par_mappings
  resources :currencies
  resources :products
  resources :product_categories
  resources :position_types
  resources :dim_dates
  resources :client_security_positions
  resources :packages
  resources :timebands
  resources :sources
  resources :scenarios

  resources :validationrules
  resources :validations

  resources :b2_ta_mappings
  resources :mortgagescollaterals
  resources :mortgages
  resources :derivatives
  resources :ratings
  resources :loanbooks
  resources :counterparties
  resources :limits
  resources :nostros
  resources :provisions

  resources :scrambles
  get "scramble/show"
  get 'scrambles/autocomplete_scramble_ClearID'

  resources :commands

  resources :homes
  resources :portals

  resources :fdbtabs
  resources :fdbclis

  # resources :autocomplete_searches, :only => [:index], :as => 'autocomplete'
  # map.resources :users, :collection => {:load_user => :get, :autocomplete => :get}




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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
