Rails.application.routes.draw do
  resources :orders
  resources :stores
  resources :warehouses
  resources :cars
  resources :computers
  resources :car_models
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
