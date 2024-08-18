Rails.application.routes.draw do
  get 'press_releases/new'
  get 'press_releases/create'
  get 'press_releases/edit'
  get 'press_releases/update'
  get 'press_releases/destroy'
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
  resources :publishers, only: [:index, :edit, :update, :new, :create] do 
      resources :press_releases, only: [:new, :create, :edit, :update, :destroy]
      # get 'new_press_release'
      # post 'create_press_release'
      # get  'edit_press_release'
      # patch 'update_press_release'
      # delete 'destroy_press_release'
  end

  root to: 'home#index'


  # Root path should direct to the Devise sign-in page
  
  # Defines the root path route ("/")
  # root "posts#index"
end
