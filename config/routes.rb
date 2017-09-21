Rails.application.routes.draw do

  # root '/articles'

  resources :articles, only: [:new, :create, :index, :show] do
    resources :versions, only: [:new, :create]
  end

  # get '/articles' => 'articles#index'
  # get '/articles/new' => 'versions#new'
  # post '/articles' => 'versions#create'
  # get '/articles/:id' => 'articles#show'
  # get '/articles/:id/edit' => 'versions#new'
  # put '/articles/:id' => 'versions#create'

  resources :users, only: [:new, :create, :edit, :update, :index, :show]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
