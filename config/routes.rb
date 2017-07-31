Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  get "intro", to: "home#new"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/login", to: "sessions#destroy"

  resources :users, only: [:new, :create]

  resources :dailies
  resources :resources, except: [:show]


end
