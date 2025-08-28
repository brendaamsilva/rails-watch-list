Rails.application.routes.draw do
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


end
