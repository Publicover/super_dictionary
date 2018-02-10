Rails.application.routes.draw do

  # get 'users/new'
  #
  # get 'users/create'
  #
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions
  # post 'signup' => 'users#create'
  # post '/users' => 'users#create'
  # patch 'users' => 'users#update'
  root 'dashboards#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
