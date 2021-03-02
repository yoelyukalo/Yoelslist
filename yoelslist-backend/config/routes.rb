Rails.application.routes.draw do
  # get 'posts/index'
  # get 'posts/new'
  # get 'posts/show'
  # get 'posts/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts

  resources :users, only: [:create]
  post '/login', to: 'auth#create'
  post '/auto_login', to: 'auth#auto_login'
  get '/logged_in', to: 'application#logged_in?'
  # get '/things', to: 'things#index'
  
  get '/users', to: 'users#index'
  # root 'posts#index'
	resources :posts
end
