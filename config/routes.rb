Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :imports, only: [:index, :create]
end
