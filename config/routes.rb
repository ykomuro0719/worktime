Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, controllers: {
    registrations:  "users/registrations",
    sessions:       "users/sessions",
    passwords:      "users/passwords"
  }
  devise_for :installs
  resources :users, :only => [:index, :new, :show, :edit, :update]

  root to: "works#index"

  resources :"works" do
      collection do
        get :getchild1
        get :getchild2
        get :getrequest
        get :getworkstart
        get :getworkend
        get :getbreaktime1
      end
    end
  resources "works" , only: [:new, :create, :edit, :update, :destroy]
  resources "works", param: :date, :only => [:show]

    namespace :admin do
     resources :tasks, only: [:index, :new, :create, :show, :edit, :update, :destroy]
     resources :requests, only: [:index, :new, :create, :edit, :update, :destroy]
     resources :child1tasks, only: [:index, :new, :create, :edit, :update, :destroy]
     resources :child2tasks, only: [:index, :new, :create, :edit, :update, :destroy]
     resources :groups, only: [:index, :new, :create, :edit, :update, :destroy]
end
  
  
  #get 'works/:date/new' to: 'works#new',as: 'new_work'
  #get 'works/:date/edit' to: 'works#edit',as: 'edit_work'
  #get 'works/:date' to: 'works#show',as: 'work'
  #post 'works/:date' to: 'works#create'
  #patch 'works/:date' to: 'works#update'
 # delete 'works/:id' to:'works#destroy' as:'destroy_work'
  
  #delete 'works/:date/:id' => 'works#destroy', as: 'destroy_work'
  #patch 'works/:date/edit/:id' => 'works#update'
  #resources :works, param: :date 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
