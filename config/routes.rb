Rails.application.routes.draw do
  resources :workshops

  root 'workshops#index'
end
