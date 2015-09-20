Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :imports, only: [:index, :create]
  resources :exports, only: [:create]
end
