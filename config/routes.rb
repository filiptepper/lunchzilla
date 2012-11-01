Lunchzilla::Application.routes.draw do
  resource :sessions, only: [:destroy]
  resources :orders, only: [:index]

  get '/auth/:provider/callback', to: 'sessions#create'
  root to: 'home#show'
end