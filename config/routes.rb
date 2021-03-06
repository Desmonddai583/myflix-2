Myflix::Application.routes.draw do
  root to: 'pages#front'
  resources :videos, only: [:show] do
    collection do
      get 'search', to: 'videos#search'
    end
    resources :reviews, only: [:create]
  end
  get 'home', to: 'videos#index'
  resources :categories, only: [:show]
  resources :users, only: [:create]
  resources :sessions, only: [:create]
  get 'register', to: 'users#new'
  get 'sign_in', to: 'sessions#new'
  get 'sign_out', to: 'sessions#destroy'
  get 'ui(/:action)', controller: 'ui'
end
