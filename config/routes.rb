OutpatientThesis::Application.routes.draw do

  resources :orthodontics
  resources :pediatrics
  resources :schedules
  resources :users
  resources :inventories
  resources :analytics
  resources :immunizations 
  resources :pendings
  resources :ortho_examinations
  resources :pedia_examinations
  resources :sessions
  
  match 'orthodontics', to: 'orthodontics#create'
  match '/home', to: 'access#home'
  match '/print_ortho', to: 'orthodontics#print_records'
  match '/print_pedia', to: 'pediatrics#print_records'
  match '/logout', to: 'sessions#destroy', via: :delete

  # T`he priority is based upon order of creation:
  # first created -> highest priority.
  # root :to => "public#index"
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
  root :to => 'sessions#login'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
  
end
