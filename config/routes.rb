Rails.application.routes.draw do
  root 'workshops#index'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :workshops
  
  get 'register', to: 'users#new', as: 'register'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
