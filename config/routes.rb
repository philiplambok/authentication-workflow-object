Rails.application.routes.draw do
  resources :authentication, only: [:create]
  resources :dashboard, only: [:index]
end
