Rails.application.routes.draw do
  # get 'johnson_calls/index'
  #
  # get 'johnson_calls/show'
  #
  # get 'johnson_calls/new'
  #
  # get 'johnson_calls/edit'
  #
  # get 'johnson_calls/create'
  #
  # get 'johnson_calls/update'
  #
  # get 'johnson_calls/destroy'

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
  resources :johnson_calls

  get 'signup', to: 'users#new', as: 'signup'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  root 'dashboards#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# 9 am employee wellness center
