Rails.application.routes.draw do
  root 'prototypes#index'
  devise_for :users


  get  '/prototypes/index'  =>    'prototypes#index'
  get  '/prototypes/new'    =>    'prototypes#new'
  get  '/prototypes/show'   =>    'prototypes#show'
end
