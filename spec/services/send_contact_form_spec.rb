require 'rails_helper'

RSpec.describe SendContactForm do
  describe "Sending a contact form notification email" do
    let(:message) { build(:message) }

    it "should send a Comment notification email" do
      expect { SendContactForm.call(message.to_json)}.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end