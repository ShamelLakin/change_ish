Rails.application.routes.draw do
  get '/login', to: "users#new"
  post '/users', to: "users#create"
  resources :users 
  resources :articles do 
    resources :comments
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
