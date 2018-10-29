require 'rails_helper'

RSpec.describe SendContactFormJob, type: :worker do
  describe "sending an Comment form", sidekiq: :inline do
    before do
      allow(SendContactForm).to receive(:call)
    end

    let(:message) { build(:message) }

    it "should queue a worker" do
      SendContactFormJob.perform_async(message.to_json)
      expect(SendContactForm).to have_received(:call).with(message.to_json)
    end
  end
end