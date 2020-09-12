Rails.application.routes.draw do
  get 'home/index'
  
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#create'
 #may be POST 
  resources :users 
  resources :articles do 
    resources :comments
  end
  root 'home#index'
end
