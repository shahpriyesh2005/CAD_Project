Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :users do
    resources :wishlists
    resources :subscriptions
  end

  resources :events do
    resources :tickets
    resources :orders
    resources :ratings
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
