Lunchzilla::Application.routes.draw do
  resource :sessions, only: [:destroy]
  resources :orders, only: [:index, :new, :create, :show] do
    resources :items, only: [:new, :create]
  end

  get '/auth/:provider/callback', to: 'sessions#create'
  root to: 'home#show'
end