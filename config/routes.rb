Rails.application.routes.draw do

  resources :notifications
  patch '/markAsRead' => 'notifications#markAsRead'
  get '/markAsRead' => 'notifications#index'
  get '/signedinuserprofile' => 'users#signedinuserprofile'
  post '/showOrganizerEvents' => 'events#showOrganizerEvents'
  get '/showOrganizerEvents' => 'events#showOrganizerEvents'

  get 'events_imports/new'
  get 'events_imports/create'
  devise_for :users
  root 'home#index'
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
  end

  resources :ratings
  
  resources :events_imports, only: [:new, :create]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
