Rails.application.config.to_prepare do
  Wisper.subscribe(SendCommentNotificationListener.new)
  Wisper.subscribe(SendEmailCampaignListener.new)
  Wisper.clear if Rails.env.development? || Rails.env.test?
end