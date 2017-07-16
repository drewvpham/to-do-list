Rails.application.routes.draw do
   get '/auth/:provider/callback' => 'sessions#create'
  resources :users
  resources :sessions
  resources :items
  resources :lists do
    resources :items
  end
  root 'lists#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
