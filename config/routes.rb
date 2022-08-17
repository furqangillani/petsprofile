Rails.application.routes.draw do
  
  root 'pages#home'
  get 'pages/about'

  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :comments, only:  [:create, :destroy]
  end

  resources :pets
  resources :services
  resources :orders
  resources :profiles
  resources :likes, only: [:create, :destroy]

  resources :home do
    get :post, on: :collection
  end

  resources :types

  # Defines the root path route ("/")
  # root "articles#index"
end
