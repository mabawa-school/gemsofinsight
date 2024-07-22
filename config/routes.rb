Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  namespace :admin do
    resources :articles
    resources :blog_categories do
      resources :blogs
    end
    resources :orders
    resources :products do
      resources :stocks
    end
      resources :categories
  end
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  authenticated :admin_user do
    root to: "admin#index", as: :admin_root
  end

  resources :categories, only: [:show, :index]
  resources :products, only: [:show, :index]
  resources :blog_categories, only: [:index, :show]
  resources :blogs, only: [:show]
  resources :carts, only: [:create, :show, :destroy] do
    collection do
      post 'update_quantity'
    end
  end

  get "admin" => "admin#index"
  # get "cart" => "carts#show"
  post "checkout" => "checkouts#create"
  get "success" => "checkouts#success"
  get "cancel" => "checkouts#cancel"
  post "webhooks" => "webhooks#stripe"
end
