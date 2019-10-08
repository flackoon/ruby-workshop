Rails.application.routes.draw do
  resources :users
  resources :workshops

  root 'workshops#index'
end
