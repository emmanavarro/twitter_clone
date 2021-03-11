Rails.application.routes.draw do
  resources :users
  resources :tweets
  devise_for :users
  root 'home#index'
end
