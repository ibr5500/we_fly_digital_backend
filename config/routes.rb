Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root "users#index"
  resources :users, only: [:create, :index]
  resources :reservations, only: [:create, :index]
  resources :airlines, only: [:index, :show, :create, :destroy]

  post "/login", to: "users#login"
end
