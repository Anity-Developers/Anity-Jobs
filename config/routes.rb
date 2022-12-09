Rails.application.routes.draw do
  namespace :admin do
      resources :roles
      resources :jobs
      resources :companies
      resources :users
      resources :locations
      resources :categories

      root to: "roles#index"
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index]
  resources :companies, only: [:index, :show]
  resources :jobs, only: [:index, :show]
  get 'search' => 'jobs#search'
  # Defines the root path route ("/")
  root "jobs#index"

  # route for all actions in the dashboard controller
  get 'dashboard' => 'dashboard#index'
  namespace :dashboard do
    resources :companies, only: [:index, :show, :edit, :update]
    resources :jobs
  end
end
