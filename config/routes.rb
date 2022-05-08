Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root 'homes#top'

  resources :users
  resources :posts
  resources :maker_genres
  resources :parts_genres
  resources :coments
  resources :goods
  resources :relationships
  resources :admin_users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
