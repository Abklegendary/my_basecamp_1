Rails.application.routes.draw do
  get 'users/index'
  devise_for :users, :path_prefix => 'd'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
  get 'home/about'
  match '/users', to: 'users#index', via: 'get'
  match '/users/:id', to: 'users#show', via: 'get'
  put 'admin/:id' => 'users#admin', :as => "admin"
  resources :projects
  resources :users, only: [:show]
end
