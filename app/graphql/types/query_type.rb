module Types
  class QueryType < Types::BaseObject
    include Pagy::Backend
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :article, ArticleType, null: true do
      description "Find an article by id"
      argument :slug, String, required: true
    end

    field :articles, [ArticleType], null: false do
      argument :page, Int, required: false
    end

    def article(slug:)
      Article.friendly.find(slug) 
    end 

    def articles(page: nil)
      if page
        params[:page] = page
        @pagy, @records = pagy(Article.most_recent)
        @records
      else 
        Article.most_recent
      end
    end

    private

    def params
      @params ||= {}
    end
  end
end
