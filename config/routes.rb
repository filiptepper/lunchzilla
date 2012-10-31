Lunchzilla::Application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  root to: 'home#show'
end