module Types
  class ArticleType < GraphQL::Schema::Object
    description "A blog article"
    field :id, ID, null: false
    field :title, String, null: false
    field :text, String, null: false
    field :comments, [CommentType], null: true
    field :image, String, null: false
  end
end