Rails.application.routes.draw do

  namespace :user do
    get 'users/edit'
    get 'users/index'
    get 'users/show'
  end
  devise_for :users, skip: [:passwords] , controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  root 'user/homes#top'
  get "/about" => "user/homes#about", as: "about"
  patch "/user/edit" => "user/users#withdrawl", as: "withdrawl"
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'

  namespace :admin do
    resources :maker_genres
    resources :parts_genres
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
