module Types
  class ArticleType < GraphQL::Schema::Object
    description "A blog article"
    field :id, ID, null: false
    field :title, String, null: false
    field :text, String, null: false
    field :comments, [CommentType], null: true
    field :image, String, null: false
<<<<<<< HEAD
   
=======
>>>>>>> e8364b55aa24bf792fd5f3b19ed3e1b3fc40b31f
  end
end