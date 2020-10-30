Rails.application.routes.draw do
  root 'sessions#index'

  get '/home' => 'sessions#index'
  get '/login' => 'users#login'
  get '/signup' => 'users#signup'
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :delete]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/auth/google_oauth2/callback' => 'sessions#google'

end
