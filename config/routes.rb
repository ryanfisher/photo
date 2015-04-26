Rails.application.routes.draw do
  root to: 'root#index'

  resources :photos, only: [:index, :show]
  resources :manage, only: [:index]

  namespace :api do
    resources :photos, only: [:index]
  end
end
