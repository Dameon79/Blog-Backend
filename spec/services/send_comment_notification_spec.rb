require 'rails_helper'

RSpec.describe SendCommentNotification do
  describe "Sending a comment notification email" do
    let(:article) { create(:article) }


    it "should send a Comment notification email" do
      expect { SendCommentNotification.call(article.id) }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
