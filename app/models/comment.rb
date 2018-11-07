class Comment < ApplicationRecord
  include Wisper::Publisher

  validates :name, :body, presence: true
  belongs_to :article

  after_create :send_notification

  private

  def send_notification
    broadcast(:send_comment_notification, self.article.id)
  end
end