Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :tweets
  get 'searching', to: 'users#searching'
  post 'searching', to: 'users#searching'
  get '/:username', to: 'users#show', as: 'user'
  scope ':username' do
    resources :followings, only: [:index]
    resources :followers, only: [:index]
  end
  resources :relationships, only: [:create, :destroy]
end
