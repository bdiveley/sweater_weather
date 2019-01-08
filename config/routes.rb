Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get "/forecast", to: "forecast#show"
      resources :users, only: [:create]
      post "/sessions", to: "sessions#create"
      resources :favorites, only: [:create, :index]
      delete :favorites, to: "favorites#destroy"
    end
  end
  post "/mailers", to: "mailers#create"

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
