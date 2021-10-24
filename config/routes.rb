Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users, :only => [:index, :new, :create]
  get 'users/new'
  get 'pages/home'
  get 'pages/pinned'

  # login/logout paths:
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  # boards/:id/lists/:id
  resources :boards, only: [:show, :new, :edit, :create, :update, :destroy] do
    resources :lists, only: [:show, :new, :edit, :create, :update, :destroy]       
  end
  
  resources :snippets, only: [:show, :new, :edit, :create, :update, :destroy]

end