require 'rails_helper'

RSpec.describe SendEmailCampaignJob, type: :worker do
  describe "sending an email" do
    it "should queue a worker" do
      create(:article)
      expect {
        SendEmailCampaignJob.perform_async
      }.to change(SendEmailCampaignJob.jobs, :size).by(1)
    end
  end
end