Lunchzilla::Application.routes.draw do
  resource :sessions, only: [:destroy]

  get '/auth/:provider/callback', to: 'sessions#create'
  root to: 'home#show'
end