Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index]
  resources :companies
  resources :jobs
  # Defines the root path route ("/")
  root "jobs#index"
end
