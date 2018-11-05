class ArticlesController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @articles = pagy(Article.all.most_recent)
  end
 
  def show
    @article = Article.includes(:comments).friendly.find(params[:id])
    @comment = Comment.new
    @user = session[:userinfo]
  end
end