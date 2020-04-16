Rails.application.routes.draw do
  root 'welcome#index'
  get '/about', to: 'about#show'

  get '/login', to: 'visitors/sessions#new'

  get '/search', to: 'search#index'
  get '/search/details', to: 'search#show'

  delete '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#googleAuth'
  get '/auth/failure', to: redirect('/')

  get '/profile/questionaire', to: 'profiles#new'
  get '/profile/:id', to: 'profiles#show'
  get '/profile/:id/edit', to: 'profiles#edit'
  patch '/profile/:id', to: 'profiles#update'
  post '/profile', to: 'profiles#create'
  delete '/profile/:id', to: 'profiles#destroy'

  get '/plants', to: 'plants#index'

	namespace :user do
		get '/mygardens', to: 'mygardens#index'
		get '/mygardens/new', to: 'mygardens#new'
		post '/mygardens', to: 'mygardens#create'
		get '/mygardens/:id', to: 'mygardens/plants#index'
    delete '/mygardens/:garden_id/plants/:plant_id', to: 'mygardens/plants#destroy'
		post '/plants', to: 'plants#create'
		get '/plants/:id/mygardens', to: 'mygardens#show', as: 'plants_mygardens'

		namespace :mygardens do
			post '/:garden_id/plants/:plant_id', to: 'plants#create', as: 'plants'
		end
	end
end
