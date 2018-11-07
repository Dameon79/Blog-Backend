class SendEmailCampaignListener
  def initialize
  end

  def send_email_campaign
    SendEmailCampaignJob.perform_async
  end
end