module Types
  class MutationType < Types::BaseObject 

    field :add_comment, CommentType, null: true do
      description "Adds a comment to an article"
      argument :slug, String, required: true
      argument :name, String, required: true
      argument :body, String, required: true
      argument :avatar, String, required: true
    end


    def add_comment(slug:, name:, body:, avatar:)
      article = Article.friendly.find(slug)
      article.comments.create(name: name, body: body, avatar: avatar)

    end 
  end
end

 