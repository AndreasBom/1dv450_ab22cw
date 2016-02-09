Rails.application.routes.draw do
  namespace :api, :defaults => {:format => :json} do


  end


  get 'sessions/new'
  get 'home' => 'home#index'
  get 'developer/register'  => 'users#new'
  get 'developer/login' => 'sessions#new'
  post 'developer/login' => 'sessions#create'
  delete 'developer/logout' => 'sessions#destroy'


  resources :users do
    resources :apis, only: [:new, :create, :destroy]
  end


  resources :apis, only: [:new, :create]
  get 'users/:id/apis/:id' => 'apis#show'
  delete 'users/:id/apis/:id' => 'apis#destroy'
  get 'user' => 'users#show'

  root 'home#index' #'home#index'


  #get 'users/:id/api' => 'apis#new'




  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


end
