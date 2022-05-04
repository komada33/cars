Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root 'homes#top'

  get 'users/index'
  get 'users/edit'
  get 'users/show'
  get 'posts/new'
  get 'posts/index'
  get 'posts/edit'
  get 'posts/show'
  get 'genres/index'
  get 'genres/edit'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
