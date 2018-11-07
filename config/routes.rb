Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
<<<<<<< HEAD
  root 'static_pages#home'
=======
  root 'articles#index'
>>>>>>> e8364b55aa24bf792fd5f3b19ed3e1b3fc40b31f

  get 'auth/oauth2/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
  get 'auth/logout' => 'auth0#logout'

  get 'pages/contact', to: 'static_pages#contact'
  get 'pages/about', to: 'static_pages#about'
  get 'pages/projects', to: 'static_pages#projects'

  namespace :admin do
    root 'articles#index'
    resources :articles
  end

  resources :articles do 
    resources :comments
  end

  resources :messages, only: [:create, :new]
  
  require 'sidekiq/web'
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username), ::Digest::SHA256.hexdigest(ENV.fetch('AUTH_NAME'))) &
    ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest(ENV.fetch("AUTH_PASSWORD")))
  end 
  mount Sidekiq::Web, at: "/sidekiq"
end
