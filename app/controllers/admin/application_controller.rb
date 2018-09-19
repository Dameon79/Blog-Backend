class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  http_basic_authenticate_with name: ENV.fetch('auth_name'), password: ENV.fetch('auth_password')

  layout "admin/application"
end
