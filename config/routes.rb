Rails.application.routes.draw do
  devise_for :users

  resources :inventories, except: :index do
    resources :buyer_orders, only: [:create]
  end

  resources :buyers, only: [:show, :index, :edit, :update]

  resources :sellers, only: [:show, :index, :edit, :update]

  resources :buyer_orders, only: [:show, :destroy] do
    resources :chats, only: [:create]
    resources :reviews, only: [:new, :create]
  end

  resources :chats, only: [:show, :destroy] do
    resources :messages, only: [:create]
  end

  resources :seller_chats, only: :index

  resources :products, only: [:edit, :update, :create, :new, :destroy]


  resources :reviews, only: [:show]

  resources :seller_orders, only: [:index, :update]

  root to: 'pages#home'
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
