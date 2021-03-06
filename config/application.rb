require_relative 'boot'

require 'rails/all'
require 'rack/throttle'
require 'redis'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DSBlog
  class Application < Rails::Application
    
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'localhost:3000', 'www.dameon-sumpton.com', 'https://dameon-blog-react.herokuapp.com'
        resource '*', headers: :any, methods: [:get, :post, :options]
        
      end
    end
  end 
end
