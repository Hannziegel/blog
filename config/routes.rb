Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  get 'users/show'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [ :create]
    end
  end
end
