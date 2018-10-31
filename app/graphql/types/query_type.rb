module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :article, ArticleType , null: true do
      description "Find an article by id"
      argument :id, ID, required: true
    end

    field :articles, [ArticleType], null: true do
      description "Returns an array of all articles"
    end

    def article(id:)
      Article.find(id)
    end

    def articles
      Article.all
    end
  end
end
