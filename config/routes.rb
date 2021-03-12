Rails.application.routes.draw do
  resources :relationships, only: [:create, :destroy]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :tweets
  devise_for :users
  root 'home#index'
end
