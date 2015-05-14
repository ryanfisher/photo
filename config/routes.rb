Rails.application.routes.draw do
  devise_for :users
  root to: 'root#index'

  resources :photos, only: [:index, :show]
  resources :manage, only: [:index]

  namespace :api do
    resources :photos, only: [:index, :create, :destroy]
    resources :albums, only: [:index]
  end
end
