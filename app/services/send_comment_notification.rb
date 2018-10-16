class SendCommentNotification
  def initialize(article_id)
    self.article_id = article_id
  end

  def self.call(article_id)
    new(article_id).call
  end

  attr_accessor :article_id
  
  def call
    CommentNotificationMailer.with(article_id: article_id).comment_notification.deliver_now
  end
end