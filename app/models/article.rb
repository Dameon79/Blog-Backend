class Article < ApplicationRecord
  extend FriendlyId
  include Wisper::Publisher

  friendly_id :title, use: :slugged
  
  validates :title, :text, :image, presence: true
  has_many :comments
  has_one_attached :image
  after_create :send_campaign
  
  scope :most_recent, -> { order(created_at: :desc) }

  def send_campaign
    broadcast(:send_email_campaign)
  end
end

