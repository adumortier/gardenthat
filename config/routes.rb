Rails.application.routes.draw do

  root 'welcome#index'
	get '/about', to: 'about#show'
	get '/register', to: 'user#new'
	get '/login', to: 'session#new'
	delete '/logout', to: 'session#destroy'
end
