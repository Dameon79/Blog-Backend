class StaticPagesController < ApplicationController
  include Pagy::Backend

  def home
    @pagy, @articles = pagy(Article.most_recent)
  end

  def contact
  end

  def about
  end
  
  def projects
  end
end
