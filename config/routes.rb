Rails.application.routes.draw do

  devise_for :users

  root 'home#index'

  get '/signedinuserprofile' => 'users#signedinuserprofile'

  get 'events_imports/new'
  get 'events_imports/create'

  get 'search/index' => 'search#index'
  post '/show' => 'search#show'
  get 'search/show' => 'search#show'

  get '/home/index' => 'home#index'
  
  resources :users
  resources :orders
  resources :wishlists
  resources :subscriptions

  resources :events do
    resources :tickets
    resources :ratings
  end

  resources :events_imports, only: [:new, :create]
end
