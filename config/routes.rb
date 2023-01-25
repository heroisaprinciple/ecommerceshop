Rails.application.routes.draw do
  resources :cart_products
  resources :categories
  resources :products
  resources :orders
  resources :carts
  devise_for :users, controllers: { sessions: 'users/sessions',  registrations: 'users/registrations',
                                    passwords: 'users/passwords'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "shops#index"

  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  delete 'products/remove_from_cart/:id', to: 'products#remove_from_cart', as: 'remove_from_cart'
end
