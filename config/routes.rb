Rails.application.routes.draw do

  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "home#index"
  get 'home/about'

  resources :posts do
    resources :comments, only:  [:create, :destroy]
  end

  resources :pets
  resources :services
  resources :orders
  resources :profiles
  resources :likes, only: [:create, :destroy]

  # Defines the root path route ("/")
  # root "articles#index"
end
