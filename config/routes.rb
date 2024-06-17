Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "articles#index" # setting the root route to be the index of articles

  # get "/articles", to: "articles#index" # create a route to articles with http verb GET
  # get "/articles/:id", to: "articles#show" 

  # a combination of routes, controller actions, and views that work together to perform CRUD operations on an entity, 
  # we call that entity a resource
  resources :articles do
    resources :comments
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
