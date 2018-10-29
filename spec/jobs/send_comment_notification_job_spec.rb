require 'rails_helper'

RSpec.describe SendCommentNotificationJob, type: :worker do
  describe "sending an notification email" do
    before do
      allow(SendCommentNotification).to receive(:call)
    end

    let!(:article) { create(:article) }

    it "should queue a worker" do
      Sidekiq::Testing.inline! do
        SendCommentNotificationJob.perform_async(article.id)
      end
      expect(SendCommentNotification).to have_received(:call).with(article.id)
    end
  end
end