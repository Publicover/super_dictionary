Rails.application.routes.draw do
  get 'ex_classes/index'

  get 'ex_classes/new'

  get 'ex_classes/create'

  post 'ex_classes/show'

  get 'ex_classes/edit'

  get 'ex_classes/update'

  get 'ex_classes/destroy'

  get 'oxford_words/index'

  get 'oxford_words/show'

  get 'oxford_words/new'

  get 'oxford_words/edit'

  get 'oxford_words/create'

  get 'oxford_words/update'

  get 'oxford_words/destroy'

  resources :users
  resources :dashboards
  resources :ex_classes

  get 'signup', to: 'users#new', as: 'signup'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  root 'dashboards#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
