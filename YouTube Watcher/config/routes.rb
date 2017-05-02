Rails.application.routes.draw do
  resources :executed_searches
  resources :users
  resources :youtube_searches
  resources :videos
  resources :audits
  resources :alerts
  resources :user_signups
  resources :user_sessions

  get 'login' => 'user_sessions#new'
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy'

  get 'static_pages/about', as: 'about'
  get 'static_pages/help', as: 'help'

  root 'dashboard#index'
end
