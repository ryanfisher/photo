Rails.application.routes.draw do
  devise_for :users
  root to: 'root#index'

  resources :photos, only: [:index, :show]
  resources :dashboard, only: [:index]

  namespace :api do
    resources :photos, only: [:index, :create, :destroy]
    resources :albums, only: [:index, :show, :create, :update]
  end
end
