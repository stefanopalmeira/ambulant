Rails.application.routes.draw do
  devise_for :users 

  resources :inventories, except: :index do
    resources :orders, only: [:create]
  end

  resources :orders, only: [:destroy, :show] do
      resources :reviews, only: [:create, :new]
  end

  resources :reviews, only: [:destroy, :show, :index]


  
 
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
