Rails.application.routes.draw do
  #get 'blog/homepage', to:
  root'blog#homepage'
  get 'about', to: 'blog#about'

  resources :articles

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


end
