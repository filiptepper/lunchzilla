Lunchzilla::Application.routes.draw do
  resource :sessions, only: [:destroy]
  resources :orders, only: [:index, :new, :create]

  get '/auth/:provider/callback', to: 'sessions#create'
  root to: 'home#show'
end