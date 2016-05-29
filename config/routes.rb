Rails.application.routes.draw do
  devise_for :users
  root to: 'root#index'

  resources :albums, only: [:index, :show]
  resources :photos, only: [:index, :show]
  resources :profile, only: [:show] do
    resources :albums, only: [:index], controller: 'profile/albums'
    member { get 'recent' }
  end
  resources :profiles, only: [:index]
  resources :dashboard, only: [:index]
  get 'dashboard/*path' => 'dashboard#index'

  namespace :api do
    resources :photos, only: [:index, :show, :create, :update, :destroy]
    resources :albums, only: [:index, :show, :create, :update, :destroy]
    resources :sorted_photos, only: [:update, :destroy]
  end

  require 'sidekiq/web'
  # TODO: authorize admin users only
  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end

  get '*path' => 'errors#routing'
end
