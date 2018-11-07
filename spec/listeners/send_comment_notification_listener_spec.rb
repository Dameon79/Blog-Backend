require 'rails_helper'

RSpec.describe Comment do
  describe "Sending an notification email when a comment is added" do
    it "should queue a worker" do
      Wisper.subscribe(SendCommentNotificationListener.new) do
        expect {
          create(:article, :with_comments)
        }.to change(SendCommentNotificationJob.jobs, :size).by(1)
      end
    end
  end
end