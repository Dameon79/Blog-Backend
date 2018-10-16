require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "Sending an notification email when a comment is added" do

    it "should queue a worker" do
      expect {
        create(:article, :with_comments)
      }.to change(SendCommentNotificationJob.jobs, :size).by(1)
    end
  end
end