Rails.application.routes.draw do
  root 'users#new'
  get '/shared_lists' => 'lists#shared_lists'
  post 'lists/delete_shared' => 'lists#delete_shared'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/sessions/logout' => 'sessions#destroy'


  resources :users, except: [:index, :new]
  resources :sessions
  resources :items
  resources :lists do
    resources :items
  end
end
