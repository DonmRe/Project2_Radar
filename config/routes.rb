Rails.application.routes.draw do
  resources :posts do
    resources :comments
    end

  get 'admin/dashboard', as: :dashboard

  get 'pages/secret'

  root "posts#index"
  # get "posts/" => "posts#index"
  #
  # get "posts/new" => "posts#new", as: :new_post
  # post "posts/" => "posts#create"
  #
  # get "posts/:id/edit" => "posts#edit", as: :edit_post
  # patch "posts/:id" => "posts#update"
  #
  # get "posts/:id" => "posts#show", as: :post
  # delete "posts/:id" => "posts#destroy", as: :destroy_post

  ## user routes
  get "users/new" => "users#new", as: :new_user
  post "users" => "users#create"

  ##Comments routes

  get "posts/:post_id/comments/new" => "comments#new", as: :new_comment
  post "posts/:post_id/comments/" => "comments#create"
  get "posts/:id/comments/:id/edit" => "comments#edit", as: :edit_comment

  ##sessions routes
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
end
