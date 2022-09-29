Rails.application.routes.draw do
  # root "articles#index"
  resources :users, only: [:create, :index]
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index]
      resources :airlines, only: [:index, :show]
    end
  end
  post "/login", to: "users#login"
end
