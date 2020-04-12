Rails.application.routes.draw do
  resources :orders
  resources :order_changes
  resources :store_stocks
  resources :warehouse_stocks
  resources :cars
  resources :computers
  resources :car_models
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
