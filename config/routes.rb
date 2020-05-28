Rails.application.routes.draw do
  resources :patterns
  resources :users
  post "login", to: "authentication#login"
end
