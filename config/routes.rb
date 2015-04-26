Rails.application.routes.draw do
  resources :photos, only: [:index, :show]
  resources :manage, only: [:index]

  namespace :api do
    resources :photos, only: [:index]
  end
end
