Rails.application.routes.draw do

  get '/signedinuserprofile' => 'users#signedinuserprofile'

  get 'events_imports/new'
  get 'events_imports/create'
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

  resources :events_imports, only: [:new, :create]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
