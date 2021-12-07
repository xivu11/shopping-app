Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "home#page"
  devise_for :users
  resources :orders
  resources :products, only: [:index, :show]
  post "/checkout/create", to: "checkout#create"
  resources :webhooks, only: [:create]
end
