class CommentsController < ApplicationController
  def new 
  end

  def create
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
     if @comment.save
      flash.notice = "Comment succesfully created"
      redirect_to article_path(@article)
    else
     render :new
    end
  end

 private
  def comment_params
    params.require(:comment).permit(:body, :name, :avatar)
  end
end