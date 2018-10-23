class ArticlesController < ApplicationController

  def index
    @article = Article.all
  end
 
  def show
    @article = Article.includes(:comments).friendly.find(params[:id])
    @comment = Comment.new
    @user = session[:userinfo]
  end

  private

end