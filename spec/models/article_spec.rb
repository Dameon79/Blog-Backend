require 'rails_helper'

RSpec.describe "have_received", type: :model do
  describe 'Sends on article create' do
    it 'sends an email campaign' do
      expect { create(:article) }.to broadcast(:send_email_campaign)
    end
  end
end