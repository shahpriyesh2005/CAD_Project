Rails.application.routes.draw do

  get 'search/index' => 'search#index'
  post '/show' => 'search#show'
  get 'search/show' => 'search#show' 
  
  devise_for :users
  
  root 'home#index'
  
  resources :users do
    resources :orders
  end

  resources :wishlists
  resources :subscriptions
  
  resources :events do
    resources :ratings
    resources :tickets
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


