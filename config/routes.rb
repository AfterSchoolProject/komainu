Rails.application.routes.draw do
  root to: 'login#index'

  resources :login, only: [:index, :create]
  resources :garage
end
