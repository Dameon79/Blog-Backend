Rails.application.routes.draw do
  get 'articles/index'
  root 'articles#index'

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
