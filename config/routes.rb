Rails.application.routes.draw do
  # User signup & authentication
  post 'signup',     to: 'users#create'
  post 'auth/login', to: 'authentication#authenticate'

  # Contracts
  resources :contracts, only: [:index, :create, :show, :destroy]
end
