Lunchzilla::Application.routes.draw do
  resource :sessions, only: [:destroy]
  resources :orders do
    resources :items, only: [:new, :create, :edit, :update]
  end

  get '/auth/:provider/callback', to: 'sessions#create'
  root to: 'home#show'
end