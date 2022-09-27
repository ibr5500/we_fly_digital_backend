Rails.application.routes.draw do
  root "users#index"
  resources :users, only: [:create, :index] do
    resources :reservations, only: [:create, :index]
  end
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index]
    end
  end
  post "/login", to: "users#login"
end
