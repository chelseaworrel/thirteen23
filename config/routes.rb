Rails.application.routes.draw do
  root to: 'users#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  mount Attachinary::Engine => "/attachinary"
  scope ":username" do
    get '', to: 'users#show', as: 'username'
  end

  resources :users
end
