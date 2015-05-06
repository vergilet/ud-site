Rails.application.routes.draw do

  resources :categories
  resources :episodes
  resources :series
  resources :users
  root to: 'visitors#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'

  get '/load_tile/:id', to: 'series#load_tile', as: 'load_tile'
  get '/load_tile_cover/:id', to: 'series#load_tile_cover', as: 'load_tile_cover'

end
