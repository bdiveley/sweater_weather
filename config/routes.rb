Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get "/forecast", to: "forecast#show"
      resources :users, only: [:create]
      post "/sessions", to: "sessions#create"
      resources :favorites, only: [:create]
    end
  end
end
