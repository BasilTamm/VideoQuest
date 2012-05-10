Videoquest::Application.routes.draw do
  
  resources :videos do 
    resources :comments    
  end
  
  get "log_out" => "Sessions#destroy", :as => "log_out"
  get "log_in" => "Sessions#new", :as => "log_in"
  get "sign_up" => "Users#new", :as => "sign_up"
  
  
  resources :users
  resources :sessions

  
  root :to => 'Videos#index'
  
  

 # get "comments" => "Comments#index", :as => "comments"
 # get "new_comment" => "Comments#new", :as =>"new_comment"
  
  #get "videos" => "Videos#index", :as => "video"
  #get "new_video" => "Videos#new", :as => "new_video"
  

  
end
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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

