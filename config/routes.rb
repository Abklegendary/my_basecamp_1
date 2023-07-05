Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'd'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
  get 'home/about'
  delete '/users/:id', to: 'users#destroy', as: :user

  resources :projects
  resources :users

  put 'admin/:id' => 'users#admin', :as => "admin"
end
