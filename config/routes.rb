Rails.application.routes.draw do
  root to: 'users#index'
  mount Attachinary::Engine => "/attachinary"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  scope ":username" do
    get '', to: 'users#show', as: 'username'
  end

  resources :users
end
