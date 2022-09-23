Rails.application.routes.draw do
  # root "articles#index"
  resources :users, only: [:create]
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
end
