Rails.application.routes.draw do
  resources :likes
  root to: "home#index"
  resources :follow_requests
  resources :comments
  resources :photos
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
