class Admin::CommentsController < Admin::ApplicationController
  def destroy
    comment = Comment.find(params[:id])
    article = comment.article
    comment.destroy
    redirect_to admin_article_path(article)
  end
end