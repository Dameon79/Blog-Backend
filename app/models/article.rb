class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  validates :title, :text, :image, presence: true
  has_many :comments
  has_one_attached :image
  after_create :send_campaign
  
  scope :most_recent, -> { order(created_at: :desc) }
  private

  def send_campaign
    SendEmailCampaignJob.perform_async
  end
end

