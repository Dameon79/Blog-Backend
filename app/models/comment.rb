class Comment < ApplicationRecord
  validates :name, :body, presence: true
  belongs_to :article

  after_create :send_notification

  private

  def send_notification
    SendCommentNotificationJob.perform_async(self.article.id)
  end

end