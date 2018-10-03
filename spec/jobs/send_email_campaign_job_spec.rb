require 'rails_helper'

RSpec.describe SendEmailCampaignJob, type: :worker do
  describe "sending an email" do
    it "should queue a worker" do
      expect {
        SendEmailCampaignJob.perform_async(1, 2)
      }.to change(SendEmailCampaignJob.jobs, :size).by(1)
    end
  end
end