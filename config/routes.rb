Rails.application.routes.draw do
  resources :users, only: [:new, :create, :edit, :update, :index, :show]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/unauthorized' => 'errors#unauthorized'
  get '/jedidetected' => 'errors#jedidetected'


end
