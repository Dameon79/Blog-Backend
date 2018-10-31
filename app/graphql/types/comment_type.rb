module Types
  class CommentType < GraphQL::Schema::Object
    description "Comment for blog article"
    field :id, ID, null: false
    field :body, String, null: false
    field :name, String, null: false
    field :article, ArticleType, null: false
  end
end