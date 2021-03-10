Rails.application.routes.draw do
  resources :tweets, controllers: { registrations: :registrations }
  devise_for :users
  root 'home#index'
end
