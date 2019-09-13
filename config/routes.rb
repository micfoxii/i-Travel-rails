Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  
  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  delete '/logout', to: 'sessions#destroy', as: 'delete_user_session' #delete_user_session_path

  resources :users do
    resources :reviews
  end

  resources :cities do
    resources :reviews
  end

  resources :countries do
    resources :cities
  end

  resources :reviews
  resources :states
  resources :countries
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
