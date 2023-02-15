Rails.application.routes.draw do
  resources :categories, only: [:index, :show]
  resources :products, only: [:index, :show]
  resources :orders
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "shops#index"

  # get 'cart/'
  get 'cart', to: 'carts#show', as: :show_cart
  post 'cart/:id', to: 'carts#add_product', as: :add_product_to_cart
  delete 'cart/:id', to: 'carts#destroy_product', as: :destroy_cart_product

  # order
  get 'success/:id', to: 'orders#success', as: 'orders_success'
end
