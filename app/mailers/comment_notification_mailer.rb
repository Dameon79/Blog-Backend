class CommentNotificationMailer < ApplicationMailer

  def comment_notification
    @article = Article.find(params[:article_id])
    mail(to: 'dameon@dameon-sumpton.com', subject: 'There are new comments to review')
  end
end