class ArticlesController < ApplicationController
  include Pagy::Backend

  after_action :set_return_url, only: :show
  
  def index
    @pagy, @articles = pagy(Article.all.most_recent)
  end
 
  def show
    @article = Article.includes(:comments).friendly.find(params[:id])
    @comment = Comment.new
    @user = session[:userinfo]
  end

  private
  
  def set_return_url
    session[:return_url] = article_url(@article)
  end
end