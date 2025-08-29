Rails.application.routes.draw do
  get 'bookmark/new'
  get 'bookmark/create'
  get 'bookmark/destroy'
  get 'lists/index'
  get 'lists/show'
  get 'lists/new'
  get 'lists/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # A user can see all the lists
  get "lists", to: "lists#index"
  # A user can see the details of a given list and its name
  get "lists/:id", to: "lists#show", as: :list
  # A user can create a new list
  get "lists/new", to: "lists#new", as: :new_list
  post "lists", to: "lists#create"

  # A user can add a new bookmark (movie/list pair) to an existing list
  get "lists/:id/bookmarks/new", to: "bookmarks#new", as: :new_list_bookmark
  post "lists/:id/bookmarks", to: "bookmarks#create", as: :list_bookmarks

  # A user can delete a bookmark from a list
  delete "bookmarks/:id", to: "bookmarks#destroy", as: :bookmark

  # resources :lists, only: [:index, :show, :new, :create] do
  #   resources :bookmarks, only: [:new, :create]
  # end
  # resources :bookmarks, only: :destroy



end
