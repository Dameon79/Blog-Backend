require 'rails_helper'

RSpec.describe "have_received", type: :model do
  describe "Sending an email when an article is created" do

    it "should queue a worker" do
      
      expect {
        create(:article)
      }.to change(SendEmailCampaignJob.jobs, :size).by(1)
    end
  end
end