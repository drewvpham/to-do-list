Rails.application.routes.draw do

  # get '/shared_lists' => 'lists#shared_lists'
  # post '/shared_lists' => 'lists#create_shared_list'
  root 'users#new'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/sessions/logout' => 'sessions#destroy'


  resources :users
  resources :sessions
  resources :items
  resources :lists do
    resources :items
  end
end
