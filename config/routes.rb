Rails.application.routes.draw do
  
  #new user sign up form
  get 'users/index', to: 'users#index', as: :users
  get 'users/new', to: 'users#new', as: :new_user
  post '/', to: 'users#create', as: :create_user

  #to display the form
  get 'sessions/new', to: 'sessions#new', as: :new_session
  #create a new session
  post 'sessions/new', to: 'sessions#create', as: :create_session
  get 'sessions/destroy', to: 'sessions#destroy', as: :destroy_session

  get '/posts', to: 'posts#index', as: :posts
  get '/posts/new', to: 'posts#new', as: :new_post
  post '/posts', to: 'posts#create', as: :create_post
  get '/posts/:id/edit', to: 'posts#edit', as: :edit_post
  patch '/posts/:id/edit', to: 'posts#update', as: :update_posts
  put '/posts/:id/edit', to: 'posts#update', as: :update_post
  delete '/posts/:id', to: 'posts#destroy', as: :destroy
  get '/posts/:id', to: 'posts#show', as: :post

  post '/posts/:id/comments', to: 'comments#create', as: :create_comment
  delete '/posts/:id/comments', to: 'comments#destroy', as: :destroy_comment
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'posts#index', as: :home

  get 'lists/' => 'lists#index', as: :lists

  post 'lists/' => 'lists#create', as: :lists_create

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
