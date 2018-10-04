class ArticlesController < ApplicationController

  def index
    @article = Article.all
  end
 
  def show
    @article = Article.friendly.find(params[:id])
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end