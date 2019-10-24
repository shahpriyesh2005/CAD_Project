Rails.application.routes.draw do
  root 'users#index'
  resources :users do
    resources :subscriptions
    resources :events
  end
  resources :wishlists
  resources :tickets  
  resources :orders
  resources :ratings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


