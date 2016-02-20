Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'positions/show/all' => 'positions#index'
      get 'positions/show/:id' => 'positions#show'
      post 'positions/create' => 'positions#create'

      post 'tags/create' => 'tag#create'
      get 'tags/show/all' => 'tag#index'
      get 'tags/show/:id' => 'tag#show'

      get 'events/show/all' => 'events#index'
      get 'events/show/:id' => 'events#show'
      post 'events/create' => 'events#create'

      get 'creators' => 'creators#index'
      get 'creators/show/:id' => 'creators#show'
      get 'creators/new' => 'creators#new'
      post 'creators/create' => 'creators#create'
      delete 'creators/delete' => 'creators#destroy'
      resources :creators

      get 'sessions/new'
      get 'home' => 'home#index'
      get 'developer/register'  => 'users#new'
      get 'developer/login' => 'sessions#new'
      post 'developer/login' => 'sessions#create'
      delete 'developer/logout' => 'sessions#destroy'

    end
  end

  resources :users do
    resources :apis, only: [:new, :create, :destroy]
  end

  resources :apis, only: [:new, :create]
  get 'users/:id/apis/:id' => 'apis#show'
  delete 'users/:id/apis/:id' => 'apis#destroy'
  get 'user' => 'users#show'

  root 'sessions#new'

end
