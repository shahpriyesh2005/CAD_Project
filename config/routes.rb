Rails.application.routes.draw do

  devise_for :users
  root 'home#index'

  get 'search/index' => 'search#index'
  post '/show' => 'search#show'
  get 'search/show' => 'search#show'
  
  resources :users
  resources :orders
  resources :wishlists
  resources :subscriptions

  resources :events do
    resources :tickets
    resources :ratings
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
