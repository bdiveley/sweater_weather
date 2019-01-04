Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get "/forecast", to: "forecast#show"
      resources :users, only: [:create]
      post "/sessions", to: "sessions#create"
      get "/gifs", to: "gifs#index"
    end
  end
end
