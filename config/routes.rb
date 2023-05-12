require "sidekiq/web"
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
  resources :companies
  resources :jobs, only: [:index, :show] do
    post :index, on: :collection
  end
  get "search" => "jobs#search"

  mount Sidekiq::Web => "/sidekiq"
  # Defines the root path route ("/")
  root "jobs#index"
  get "/load_more/:page", to: "jobs#load_more"

  # route for all actions in the dashboard controller
  get "dashboard" => "dashboard#index"
  namespace :dashboard do
    resources :companies, only: [:index, :show, :edit, :update]
    resources :jobs do
      member do
        post :publish
      end
    end
  end

  post "/track_time/:job_id", to: "tracking#send_notification"
end
