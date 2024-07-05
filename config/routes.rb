Rails.application.routes.draw do
  get 'calendar/authorize'
  get 'calendar/callback'
  get 'calendar/create_event'
  get 'logs/index'
  get 'users/index'
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root 'home#index'

  resources :home, only: [:index]
  resources :logs, only: [:index]
  resources :users do
    patch 'save_text', on: :member, to: 'users#save_text'
  end

  post '/calendar/save_date', to: 'calendar#save_date'
end
