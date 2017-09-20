Rails.application.routes.draw do

  # root '/articles'

  resources :articles, only: [:new, :create, :index, :show] do
    resources :versions, only: [:new, :create]
  end

  resources :users, only: [:new, :create, :edit, :update, :index, :show]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/articles/new' => 'versions#new'
end
