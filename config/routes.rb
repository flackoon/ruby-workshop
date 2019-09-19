Rails.application.routes.draw do
  resources :workshop

  root 'workshop#index'
end
