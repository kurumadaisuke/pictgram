Rails.application.routes.draw do
  get 'sessions/new'

  root 'pages#index'
  get 'pages/help'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/search', to: 'topics#search'
  
  # post 'topics/update' , to: 'topics#update', as: 'topics_update'
  
  resources :users
  
  resources :topics do
    collection do
      post :ajax_gram
    end
  end
  
  # resources :favorites
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  
  # コメント実装
  resources :comments
end
