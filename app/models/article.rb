class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  validates :title, :text, :image, presence: true
  has_many :comments
  has_one_attached :image
  after_create :send_campaign

  
  private

  def send_campaign
    SendEmailCampaignJob.perform_async
  end
end

