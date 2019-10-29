Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :users
  resources :orders
  resources :ratings
  resources :wishlists
  resources :subscriptions

  resources :events do
    resources :tickets
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
