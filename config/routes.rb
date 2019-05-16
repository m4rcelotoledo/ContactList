Rails.application.routes.draw do
  root to: 'tracks#index'

  resources :contacts, only: %i[create index update show]
  resources :tracks, only: %i[create index show]
end
