Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/camera', to: 'pages#camera'
  resources :photos, only: [:create]

  get '/googleApi', to: 'photos#googleApi'



  resources :users, only: [] do
    resources :comments, only: [:new, :create]
  end

  resources :events do
    collection do
      get 'search', to: 'events#search'
      get 'nearby', to: 'events#nearby'
    end
    resources :photos, only: [:create, :show, :destroy]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
