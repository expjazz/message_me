# frozen_string_literal: true

Rails.application.routes.draw do
  root 'chatroom#index'
  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  resources :users
  post '', to: 'messages#create'
  resources :messages
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  mount ActionCable.server, at: '/cable'
end
