Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # A visitor can see the list of all restaurants = GET "restaurants"
#   A visitor can add a new restaurant, and be redirected to the show view of that new restaurant.
  #  GET "restaurants/new"
  # POST "restaurants"
  # GET "restaurants/38/reviews/new"
  # POST "restaurants/38/reviews"

  resources :restaurants, only: %i[index new create show] do
    resources :reviews, only: %i[new create]
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
