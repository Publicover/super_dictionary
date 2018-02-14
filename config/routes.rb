Rails.application.routes.draw do
  get 'oxford_words/index'

  get 'oxford_words/show'

  get 'oxford_words/new'

  get 'oxford_words/edit'

  get 'oxford_words/create'

  get 'oxford_words/update'

  get 'oxford_words/destroy'

  resources :users

  get 'signup', to: 'users#new', as: 'signup'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  root 'dashboards#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
