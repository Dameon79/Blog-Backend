Rails.application.routes.draw do
  get 'articles/index'
  root 'articles#index'

  get 'auth/oauth2/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'

  namespace :admin do
    root 'articles#index'
    resources :articles
  end

  resources :articles do 
    resources :comments
  end

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
