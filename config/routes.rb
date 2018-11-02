Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users

  # For testing purposes
  root 'home#index'
end
