class SendCommentNotificationJob
  include Sidekiq::Worker
  
  def perform(article_id)
    SendCommentNotification.call(article_id)
  end
end