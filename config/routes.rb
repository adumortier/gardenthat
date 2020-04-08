Rails.application.routes.draw do

  get '/', to: 'welcome#index'
  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')
end
