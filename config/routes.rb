Rails.application.routes.draw do
  #get 'blog/homepage', to:
  root'blog#homepage'
  get 'about', to: 'blog#about'

  resources :articles

  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end
