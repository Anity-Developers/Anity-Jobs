Rails.application.routes.draw do
  namespace :admin do
      resources :roles
      resources :jobs
      resources :companies
      resources :users
      resources :locations

      root to: "roles#index"
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index]
  resources :companies
  resources :jobs
  # Defines the root path route ("/")
  root "jobs#index"
end
