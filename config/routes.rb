Rails.application.routes.draw do
  resources :categories do
    resources :products
  end

  resources :orders
  # resources :webhooks, only: [:create]
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "shops#index"

  # get 'cart/'
  get 'cart', to: 'carts#show', as: :show_cart
  post 'cart/:id', to: 'carts#add_product', as: :add_product_to_cart
  delete 'cart/:id', to: 'carts#destroy_product', as: :destroy_cart_product

  # order
  get 'success/:id', to: 'orders#success', as: 'orders_success'

  # payment
  post "create-checkouts-session", to: 'carts#create_checkout_session', as: :create_checkout_session
  # get 'checkouts', to: 'checkouts#show'
  # get 'billing', to: 'billings#show'
end
