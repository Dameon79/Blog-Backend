class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  validates :title, :text, presence: true
  after_create :send_campaign
  
  private

  def send_campaign
    SendEmailCampaign.call
  end
end

