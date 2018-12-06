source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2', '>= 5.2.1'
# Use sqlite3 as the database for Active Record
gem 'pg', '~> 1.1', '>= 1.1.3'

# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem "chromedriver-helper"
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap', '~> 4.1.3'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'foreman', '~> 0.85.0'
gem 'thor', '~> 0.19.1'
gem 'faker', '~> 1.8', '>= 1.8.7'
gem 'selenium-webdriver', '~> 3.14'
gem 'figaro', '~> 1.1', '>= 1.1.1'
gem 'gibbon', '~> 3.2'
gem 'friendly_id', '~> 5.2', '>= 5.2.4'
gem 'sidekiq', '~> 5.2', '>= 5.2.2'
gem 'redcarpet', '~> 3.4'
gem 'rouge', '~> 3.3'
gem 'omniauth', '~> 1.6.1'
gem 'omniauth-auth0', '~> 2.0.0'
gem 'dalli', '~> 2.7', '>= 2.7.8'
gem 'aws-sdk-s3', '~> 1.21', require: false
gem 'graphql', '~> 1.8', '>= 1.8.11'
gem 'pagy', '~> 0.21.0'
gem 'wisper', '~> 2.0'
gem 'rack-cors', '~> 1.0', '>= 1.0.2'
gem 'image_processing', '~> 1.2'
gem 'mini_magick', '~> 4.9', '>= 4.9.2'
gem 'rack-throttle', '~> 0.7.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'factory_bot_rails', '~> 4.10'
  gem 'dotenv-rails', '~> 2.5'
end

group :test do
  gem 'rspec-rails', '~> 3.8'
  gem 'webmock', '~> 3.4', '>= 3.4.2'
  gem 'capybara', '~> 3.6'
  gem 'capybara-screenshot', '~> 1.0', '>= 1.0.13'
  gem 'database_cleaner', '~> 1.7'
  gem 'rspec-sidekiq', '~> 3.0', '>= 3.0.3'
  gem 'rack_session_access', '~> 0.2.0'
  gem 'wisper-rspec', '~> 1.1', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'graphiql-rails', group: :development