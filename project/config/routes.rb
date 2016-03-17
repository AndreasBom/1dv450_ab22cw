Rails.application.routes.draw do

  # Application
  get 'swll' => 'swll#index'
  get 'swll/info' => 'swll/info'

  # API
  scope :api do
    scope :v1 do
      get 'app/index' => 'app_index#index'

      get 'positions/show/all' => 'positions#index'
      get 'positions/show/:id' => 'positions#show'
      get 'positions/show/:id/nearby' => 'positions#nearby'
      post 'positions/create' => 'positions#create'
      delete 'positions/delete/:id' => 'positions#destroy'

      post 'tags/create' => 'tag#create'
      get 'tags/show/all' => 'tag#index'
      get 'tags/show/:id' => 'tag#show'
      patch 'tags/update/:id' => 'tag#update'

      get 'events/show/all' => 'events#index'
      get 'events/show/:id' => 'events#show'
      post 'events/create' => 'events#create'
      delete 'events/delete/:id' => 'events#destroy'
      patch 'events/update/:id' => 'events#update'

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

  #API registration
  resources :users do
    resources :apis, only: [:new, :create, :destroy]
  end

  resources :apis, only: [:new, :create]
  get 'users/:id/apis/:id' => 'apis#show'
  delete 'users/:id/apis/:id' => 'apis#destroy'
  get 'user' => 'users#show'

  root 'swll#index'

  match "*path", to: "swll#index", via: :all
end
