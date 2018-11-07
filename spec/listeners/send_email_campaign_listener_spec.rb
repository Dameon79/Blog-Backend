require 'rails_helper'

RSpec.describe SendEmailCampaignListener do
  describe "When an send_email_campaign event is fired" do
    it "should queue a worker" do
      Wisper.subscribe(SendEmailCampaignListener.new) do
        expect {
          create(:article)
        }.to change(SendEmailCampaignJob.jobs, :size).by(1)
      end
    end
  end
end