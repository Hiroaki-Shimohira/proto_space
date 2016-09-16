Rails.application.routes.draw do
  root 'prototypes#index'
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  namespace :prototypes do
  	resources :popular, only: :index
  end
  resources :prototypes do
  	resources :likes, only: [:create, :destroy]
  	resources :comments, only: :create
  end

end
