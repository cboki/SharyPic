Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [] do
    resources :comments, only: [:new, :create]
  end
  resources :pages, only: [:home, :about, :contact]
  resources :events, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :events, only: [:show] do
    resources :photos, only: [:new, :create, :show, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
