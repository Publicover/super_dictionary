Rails.application.routes.draw do

  resources :users
  resources :oxford_calls
  resources :full_calls
  resources :johnson_calls
  resources :webster_calls
  resources :urban_calls

  get 'signup', to: 'users#new', as: 'signup'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  root 'dashboards#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# 9 am employee wellness center
