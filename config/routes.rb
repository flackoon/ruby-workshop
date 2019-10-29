Rails.application.routes.draw do
  devise_for :users
  root 'workshops#index'
  
  resources :account, only: [:index]
  resources :workshops do
    resources :participations
  end
  resources :comments, only: [:create]
  
  get '/account/details/:id', to: 'account#show',  as: 'account'
  get '/account/edit', to: 'account#edit', as: 'edit_account'
  patch '/account/edit', to: 'account#update', as: 'update_account'
end
