# -*- encoding : utf-8 -*-post '/permissions/:id/edit', to: 'permissions#update'
SRA::Application.routes.draw do

  resources :graphs, :only => [:show, :new, :create]


  resources :reports, :only => [:new, :create]

  resources :permissions, :only => [:update, :edit, :index]
  post '/permissions/:id/edit', to: 'permissions#update'
  get '/permissions/:id', to: 'permissions#index'

  post '/reports/save_report', to: 'reports#save_report_with_graph'
  get '/send_graph', to: 'graphs#send_graph', as: 'send_graph'

  devise_for :users ,:path => '', :path_names => {:sign_in => "", :sign_out => ""}

  post '/users/retrieve_password', to: 'users#retrieve_password', as: 'retrieve_password'
  get '/users/:id/edit', to: 'users#update'

  resources :users

  post '/users/retrieve_password', to: 'users#retrieve_password', as: 'retrieve_password'

  resources :atendimentos, :except => [:show] do

    get :autocomplete_user_name, :on => :collection
  end

  resources :types, :except => [:show]  do
    get 'type_by_place', :on => :collection
  end
  resources :places, :except => [:show]
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
  root :to => 'application#index'



  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
