Rails.application.routes.draw do
  resources :cart_products
  resources :carts
  resources :categories
  resources :products
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "shops#index"
end
