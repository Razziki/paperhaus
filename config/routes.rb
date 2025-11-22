Rails.application.routes.draw do
  get "carts/show"
  ActiveAdmin.routes(self)
  get "sessions/new"
  get "users/new"
  get "users/create"
  get "users/show"
  get "about", to: "pages#about"
  get "categories/index"
  get "products/index"
  get "about",   to: "pages#about"
  get "contact", to: "pages#contact"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  root to: "products#index"
  resources :products, only: %i[ index show ]
  resources :categories, only: %i[index show]
  resources :users, only: %i[new create show]
  resources :sessions, only: %i[new create]
  delete "logout", to: "sessions#destroy"

  resource :cart, only: [ :show ]
  post   "cart/add/:product_id",    to: "carts#add",    as: :add_to_cart
  patch  "cart/update/:product_id", to: "carts#update", as: :update_cart_item
  delete "cart/remove/:product_id", to: "carts#remove", as: :remove_from_cart
end
