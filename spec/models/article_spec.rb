require 'rails_helper'

RSpec.describe "have_received", type: :model do
  describe "Sending an email when an article is created" do
    before do
      allow(SendEmailCampaign).to receive(:call)
    end

    it "should call the SendEmailCampaign class" do
      # Check that the class was called
      create(:article)
      expect(SendEmailCampaign).to have_received (:call)
    end
  end
end