Rails.application.routes.draw do
  root 'workshops#index'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :workshops do
    resources :participations
  end
  resources :account, only: [:index, :register]
  
  get '/account/login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
