Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
     ENV.fetch('AUTH0_USER'),
     ENV.fetch('AUTH0_SECRET'),
    'dameon-blog.eu.auth0.com',
    callback_path: '/auth/oauth2/callback',
    authorize_params: {
      scope: 'openid profile'
    }
  )
end