Rails.application.routes.draw do
  resources :categories
  resources :products
  resources :carts
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "shops#index"

  post 'cart/:id', to: 'cart_products#create', as: :create_cart_product
  delete 'cart/:id', to: 'cart_products#destroy', as: :destroy_cart_product
end
