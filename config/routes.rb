Rails.application.routes.draw do
  resources :pocos
  get "home/index"
  root to: "home#index"
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create' 
  delete 'logout', to: 'sessions#destroy'
end
