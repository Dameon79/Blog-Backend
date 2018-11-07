module Types
  class QueryType < Types::BaseObject
<<<<<<< HEAD
    include Pagy::Backend
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :article, ArticleType, null: true do
=======
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :article, ArticleType , null: true do
>>>>>>> e8364b55aa24bf792fd5f3b19ed3e1b3fc40b31f
      description "Find an article by id"
      argument :id, ID, required: true
    end

<<<<<<< HEAD
    field :articles, Types::ArticleType.connection_type, null: false do
      argument :page, Int, required: false
=======
    field :articles, [ArticleType], null: true do
      description "Returns an array of all articles"
>>>>>>> e8364b55aa24bf792fd5f3b19ed3e1b3fc40b31f
    end

    def article(id:)
      Article.find(id)
<<<<<<< HEAD
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
=======
    end

    def articles
      Article.all
>>>>>>> e8364b55aa24bf792fd5f3b19ed3e1b3fc40b31f
    end
  end
end
