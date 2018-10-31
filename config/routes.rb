Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  root 'articles#index'

  get 'auth/oauth2/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'

  get 'pages/contact', to: 'static_pages#contact'
  get 'pages/about', to: 'static_pages#about'

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
