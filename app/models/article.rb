class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  validates :title, :text, presence: true
  has_many :comments
  after_create :send_campaign
  
  private

  def send_campaign
    SendEmailCampaignJob.perform_async
  end
end

