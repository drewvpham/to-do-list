Rails.application.routes.draw do
  root 'users#new'
  get '/auth/:provider/callback' => 'sessions#create'
  resources :users
  resources :sessions
  resources :items
  resources :lists do
    resources :items
  end
end
