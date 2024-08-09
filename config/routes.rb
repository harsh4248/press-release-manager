Rails.application.routes.draw do
  get 'organization/new'
  get 'organization/create'
  # get 'publishers/index'
  # get 'organizations/index'
  # get 'users/index'
  devise_for :users
  # get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  resources :users, only: [:index]
  resources :organizations, only: [:index, :edit, :update, :new, :create]
  resources :publishers, only: [:index, :edit, :update] do
    member do
      get 'new_press_release'
      post 'create_press_release'
    end
  end

  root to: 'home#index'


  # Root path should direct to the Devise sign-in page
  
  # Defines the root path route ("/")
  # root "posts#index"
end
