Rails.application.routes.draw do
  resources :campaigns
  resources :users

  root 'home#index'
end
