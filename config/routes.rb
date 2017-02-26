Rails.application.routes.draw do
  #resources
#   resources :posts do
#     resources :topic do
#     resources :location
#   end
# end
  #posts
  root "posts#index"
  get "posts/" => "posts#index"
  get "posts/new" => "posts/new"
  get "posts/:id" => "posts#show"

  #sessions
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
end
