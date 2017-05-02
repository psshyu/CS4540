Rails.application.routes.draw do
  root 'static_pages#home'

  match 'static_pages/about',
        to: 'static_pages#about',
        via: :get,
        as: 'static_pages_about'
  match 'static_pages/home',
        to: 'static_pages#home',
        via: :get,
        as: 'static_pages_home'
  match 'static_pages/help',
        to: 'static_pages#help',
        via: :get,
        as: 'static_pages_help'

  match '/about', to: 'static_pages#about', via: :get, as: 'about'
  match '/help', to: 'static_pages#help', via: :get, as: 'help'
  match '/home', to: 'static_pages#home', via: :get, as: 'home'
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
