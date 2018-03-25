Rails.application.routes.draw do
  # get 'oxford_calls/index'
  #
  # get 'oxford_calls/show'
  #
  # get 'oxford_calls/new'
  #
  # get 'oxford_calls/edit'
  #
  # get 'oxford_calls/create'
  #
  # get 'oxford_calls/update'
  #
  # get 'oxford_calls/destroy'

  resources :users
  resources :oxford_calls
  resources :full_calls

  get 'signup', to: 'users#new', as: 'signup'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  root 'dashboards#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
