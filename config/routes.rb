Rails.application.routes.draw do
  devise_for :users
  root to: 'root#index'

  resources :albums, only: [:index, :show]
  resources :photos, only: [:index, :show]
  resources :profile, only: [:show] do
    resources :albums, only: [:index]
  end
  resources :dashboard, only: [:index]

  namespace :api do
    resources :photos, only: [:index, :show, :create, :update, :destroy]
    resources :albums, only: [:index, :show, :create, :update, :destroy]
  end
end
