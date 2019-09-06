Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  
  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  delete '/logout' => 'sessions#destroy'

  resources :users do
    resources :reviews
  end

  resources :cities
  resources :states
  resources :countries
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
