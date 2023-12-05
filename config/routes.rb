Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "/users" => "users#create"
  get "/me" => "users#show"
  post "/sessions" => "sessions#create"

  get "/consoles/:id" => "consoles#show"
  get "/consoles" => "consoles#index"
  post "/consoles" => "consoles#create"

  get "/games" => "games#index"
  get "/games/:id" => "games#show"
  post "/games" => "games#create"

  post "/orders" => "orders#create"
  get "/orders" => "orders#index"
  get "/orders/:id" => "orders#show"

  get "/carted_games" => "carted_games#index"
  post "/carted_games" => "carted_games#create"
  delete "/carted_games/:id" => "carted_games#destroy"

  post "/reviews" => "reviews#create"
  patch "/reviews/:id" => "reviews#update"
  delete "/reviews/:id" => "reviews#destroy"

  get "/favorites" => "favorites#index"
  post "/favorites" => "favorites#create"
  delete "/favorites/:id" => "favorites#destroy"
end
