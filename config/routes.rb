Rails.application.routes.draw do

  root 'articles#index'

  get '/articles/search' => 'articles#search'
  resources :articles, only: [:index, :show] do
    resources :versions, only: [:index, :new, :update]
  end


  resources :users, only: [:new, :create, :edit, :update, :index, :show]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


end
