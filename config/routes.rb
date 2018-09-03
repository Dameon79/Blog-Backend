Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  namespace :admin do
    root 'articles#index'
    resources :articles
  end

  resources :articles
end
