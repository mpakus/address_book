Rails.application.routes.draw do
  root 'users#index'
  resources :users do
    post :share, on: :member
  end
  resources :imports, only: [:index, :create]
  resources :exports, only: [:create]
end
