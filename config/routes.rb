Rails.application.routes.draw do
  root to: 'tracks#index'

  resources :contacts, only: [:index, :create]
  resources :tracks, only: [:index, :create]
end
