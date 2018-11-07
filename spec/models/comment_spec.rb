require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:article) { create(:article) }

  describe 'Sends on email on comment create' do
    it 'sends an email notification' do
      expect { create(:comment, article: article) }.to broadcast(:send_comment_notification)
    end
  end
end