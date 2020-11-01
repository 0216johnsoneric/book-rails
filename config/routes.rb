Rails.application.routes.draw do
  root 'users#index'

  get '/home' => 'users#index'
  get '/login' => 'users#login'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#signup'
  post '/signup' => 'users#create'
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :delete]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/auth/google_oauth2/callback' => 'sessions#google'

end
