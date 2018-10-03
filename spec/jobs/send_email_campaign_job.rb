require 'rails_helper'

RSpec.describe SendEmailCampaignJob, type: :worker do
  describe "sending an email" do
    it "should queue a worker" do
      expect (SendEmailCampaignJob).to have_enqueued_sidekiq_job('SendEmailCampaignJob', true)
  end
end
