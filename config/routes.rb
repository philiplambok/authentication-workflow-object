Rails.application.routes.draw do
  resources :authentication, only: [:create]
end
