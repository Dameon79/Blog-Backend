require 'rails_helper'

RSpec.describe SendCommentNotificationJob, type: :worker do
  describe "sending an notification email", sidekiq: :inline do
    before do
      allow(SendCommentNotification).to receive(:call)
    end

    let(:article) { create(:article) }

    it "should queue a worker" do
      SendCommentNotificationJob.perform_async(:article_id)
        expect(SendCommentNotification).to have_received (:call)
    end
  end
end