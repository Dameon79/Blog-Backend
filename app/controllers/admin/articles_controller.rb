class Admin::ArticlesController < Admin::ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end
  
  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.image.attach(article_params[:image])
     if @article.save
      redirect_to admin_articles_path
      flash.notice = "Article succesfully created"
    else
     render 'new'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to admin_articles_path
      flash.notice = "Article succesfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash.notice = "Article succesfully deleted"
    redirect_to admin_articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text, :image)
    end

    def find_article
      @article = Article.friendly.find(params[:id])
    end
end

