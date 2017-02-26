Rails.application.routes.draw do
  #posts
  root "posts#index"
  get "posts/" => "posts#index"
  get "posts/new" => "posts/new", as: :new_post
  get "posts/:id" => "posts#show", as: :post

  #sessions
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
end
