# frozen_string_literal: true

Rails.application.routes.draw do
  root 'chatroom#index'
  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  resources :users
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'users#destroy'
end
