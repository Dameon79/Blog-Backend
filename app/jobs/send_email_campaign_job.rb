class SendEmailCampaignJob
  include Sidekiq::Worker

  def perform
    SendEmailCampaign.call
  end
end
