Rails.application.routes.draw do
  resources :contacts, only: [:index, :create]
  resources :tracks, only: [:index, :create]
end
