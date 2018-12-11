module Types
  class MutationType < Types::BaseObject 

    field :addComment, CommentType, null: true do
      description "Adds a comment to an article"
      argument :slug, String, required: true
      argument :name, String, required: true
      argument :body, String, required: true
      argument :avatar, String, required: true
    end

    def addComment(slug:, name:, body:, avatar:)
      if context.fetch(:authorised)
        article = Article.friendly.find(slug)
        article.comments.create(name: name, body: body, avatar: avatar)
      else
        GraphQL::ExecutionError.new("Please Login")
      end
    end
  end    
end
