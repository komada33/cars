Rails.application.routes.draw do

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
  patch "/admin/users/:id/false" => "admin/users#withdrawl_false", as: "withdrawl_false"
  patch "/admin/users/:id/true" => "admin/users#withdrawl_true", as: "withdrawl_true"
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'

  namespace :admin do
    resources :maker_genres
    resources :parts_genres
    resources :users, only: [:index, :show, :edit, :update, :destroy, :withdrawl_false, :withdrawl_true]
  end

  scope module: :user do
    resources :users, only: [:index, :show, :edit, :update, :withdrawl] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
        collection do
          get 'search'
        end
        member do
          get :goods
        end
    end
    resources :car_posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :comments, only: [:create]
      resources :goods, only: [:create, :destroy]
    end
    resources :comments, only: [:destroy, :edit, :update]
    resources :maker_genres, only: [:index, :show]
    resources :parts_genres, only: [:index, :show]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
