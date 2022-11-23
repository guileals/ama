Rails.application.routes.draw do
  resources :pocos
  get "home/index"
  root to: "home#index"
end
