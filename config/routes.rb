Rails.application.routes.draw do
  resources :photos, only: [:index, :show]
  resources :manage, only: [:index]
end
