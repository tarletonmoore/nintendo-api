Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  get "/consoles/:id" => "consoles#show"
  get "/consoles" => "consoles#index"
  post "/consoles" => "consoles#create"

  get "/games" => "games#index"
  get "/games/:id" => "games#show"
  post "/games" => "games#create"
end
