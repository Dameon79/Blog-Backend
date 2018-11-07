class SendCommentNotificationListener
  def initialize
  end

  def send_comment_notification(article_id)
    SendCommentNotificationJob.perform_async(article_id)
  end
end
