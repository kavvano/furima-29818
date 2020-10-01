Rails.application.routes.draw do
  get 'links/index'
  devise_for :users
  root to: "items#index"
  resources :items
end
