Rails.application.routes.draw do
  root "pages#home"
  resources :packages, only: [:create]

  get "/dashboard", to: "pages#dashboard"
  devise_for :users, controllers: {
  registrations: "users/registrations"
}

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get 'username_check', to: 'users#check_username'
  

  # Defines the root path route ("/")
  # root "posts#index"
end


