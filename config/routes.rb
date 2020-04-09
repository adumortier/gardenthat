# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  get '/about', to: 'about#show'
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  
  get '/auth/:provider/callback', to: 'sessions#googleAuth'
  get '/auth/failure', to: redirect('/')
end
