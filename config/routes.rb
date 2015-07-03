Rails.application.routes.draw do
  root to: 'users#index'

  resources :users

  get 'username', to: 'users#show', as: 'username'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
