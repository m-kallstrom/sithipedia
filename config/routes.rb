Rails.application.routes.draw do

  root 'articles#index'

  get '/articles/search' => 'articles#search'
  resources :articles, except: [:delete] do
    resources :versions, only: [:index]
  end


  resources :users, only: [:new, :create, :edit, :update, :index, :show]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/unauthorized' => 'errors#unauthorized'
  get '/jedidetected' => 'errors#jedidetected'


end
