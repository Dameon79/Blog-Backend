Rails.application.routes.draw do
  get 'articles/index'
  root 'articles#index'

  namespace :admin do
    root 'articles#index'
    resources :articles
  end

  resources :articles
end
