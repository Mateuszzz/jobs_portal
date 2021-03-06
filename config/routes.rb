Rails.application.routes.draw do

  root 'static_pages#home'
  
  get 'home' => 'static_pages#home'

  get 'signup' => 'users#new'
  resources :users
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  resources :categories
end
