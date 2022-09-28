Rails.application.routes.draw do
  root "users#index"
  resources :users, only: [:create, :index] do
    resources :reservations, only: [:create, :index]
  end

  post "/login", to: "users#login"
end
