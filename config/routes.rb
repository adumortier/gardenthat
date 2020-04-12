# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  get '/about', to: 'about#show'
  
  get '/login', to: 'visitors/sessions#new'

  get '/search', to: 'search#index'

  delete '/logout', to: 'sessions#destroy'
  
  get '/auth/:provider/callback', to: 'sessions#googleAuth'
  get '/auth/failure', to: redirect('/')

  get '/profile/questionaire', to: 'profiles#new'
  post '/profile', to: 'profiles#create'
end
