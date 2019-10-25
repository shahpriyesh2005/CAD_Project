Rails.application.routes.draw do
  root 'users#index'
  resources :users do # Only if there is an user logged in he/she can subscribe, wishlist or add event
    resources :subscriptions
    resources :wishlists
    resources :events # Only if there is an event you can  book tickets
    resources :tickets
    resources :orders
    resources :ratings
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

