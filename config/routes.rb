Rails.application.routes.draw do
  
  constraints(host: /^(?!www\.)/i) do
    match '(*any)' => redirect { |params, request|
      URI.parse(request.url).tap { |uri| uri.host = "www.#{uri.host}" }.to_s
    }
  end

  # TODO /admin/comments-management
  get '/comments' => 'visitors#comments'

  resources :categories
  resources :episodes
  resources :series

  get '/series/genre/:search' => 'series#genre', :as => :genre

  resources :users
  root to: 'visitors#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'

  get '/load_tile/:id', to: 'series#load_tile', as: 'load_tile'
  get '/load_tile_cover/:id', to: 'series#load_tile_cover', as: 'load_tile_cover'
end
