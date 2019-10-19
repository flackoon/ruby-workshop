Rails.application.routes.draw do
  root 'workshops#index'
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :workshops do
    resources :participations
  end
  resources :account, only: [:index]
  
  get '/account/edit', to: 'account#edit', as: 'edit_account'
  patch '/account/edit', to: 'account#update', as: 'update_account'
  get '/account/register', to: 'account#register', as: 'register'
  post '/account/register', to: 'account#create', as: 'create_account'
  get '/account/login', to: 'sessions#new', as: 'login'
  post '/account/login', to: 'sessions#create', as: 'login_post'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
