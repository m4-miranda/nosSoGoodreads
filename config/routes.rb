Rails.application.routes.draw do
  get 'lists/new'

  root 'sessions#new'

  get '/login',   to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  delete '/logout',  to: 'sessions#delete'

  post '/books', to: 'books#add'
  delete '/books', to: 'books#delete'
  get '/books', to:'books#show'
  patch '/books', to: 'books#update'

  post '/home', to: 'books#index'
  get '/home',  to: 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
end
