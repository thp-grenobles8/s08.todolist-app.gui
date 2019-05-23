Rails.application.routes.draw do
  devise_for :users
  # root to: "home#index"
  resources :tasks, except: [:show]

  resources :emails
  root to: "emails#index"
end
