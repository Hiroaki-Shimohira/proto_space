Rails.application.routes.draw do
  root 'prototypes#index'
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :prototypes, only: [:new, :create, :show]


  # get  '/prototypes/index'  =>    'prototypes#index'
  # get  '/prototypes/new'    =>    'prototypes#new'
  # get  '/prototypes/show'   =>    'prototypes#show'
end
