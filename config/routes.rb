Rails.application.routes.draw do
  devise_for :users 

  resources :inventories, except: :index do
    resources :order, only: [:show, :destroy, :create]
  end
  
 
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
