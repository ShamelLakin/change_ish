Rails.application.routes.draw do
  get '/auth/facebook/callback' => 'sessions#create'
  
  get '/signup', to: 'registrations#new'
  post '/users', to: 'registrations#create'

  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  
  resources :users 

  resources :articles do 
    resources :comments
  end

  get '/logout', to: 'sessions#destroy'

  root 'home#index'
end
