class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  http_basic_authenticate_with name: ENV.fetch('AUTH_NAME'), password: ENV.fetch('AUTH_PASSWORD')

  layout "admin/application"
end
