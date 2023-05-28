Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  resources :categories, param: :slug do
    resources :products, param: :slug
  end

  resources :orders
  # resources :webhooks, only: [:create]
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations',
                                    passwords: 'users/passwords' }

  resources :webhooks, only: [:create]

  root "shops#index"

  # get 'cart/'
  get 'cart', to: 'carts#show', as: :show_cart
  post 'cart/:id', to: 'carts#add_product', as: :add_product_to_cart
  delete 'cart/:id', to: 'carts#destroy_product', as: :destroy_cart_product

  # order
  get 'success/:id', to: 'orders#success', as: 'orders_success'

  # payment
  get "success", to: "carts#success"
  get "cancel", to: "carts#cancel"
  post "create-checkouts-session", to: 'carts#create_checkout_session', as: :create_checkout_session
end
