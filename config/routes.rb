Rails.application.routes.draw do
  #get 'blog/homepage', to:
  root'blog#homepage'
  get 'about', to: 'blog#about'

  resource :articles
end
