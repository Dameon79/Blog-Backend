require 'rails_helper'

RSpec.describe SendEmailCampaignJob, type: :worker do
  describe "sending an email", sidekiq: :inline do
    before do
      allow(SendEmailCampaign).to receive(:call)
    end

    it "should queue a worker" do
        Sidekiq::Testing.inline! do
        SendEmailCampaignJob.perform_async
        expect(SendEmailCampaign).to have_received (:call)
       end
    end
  end
end