module Types
  class ArticleType < GraphQL::Schema::Object
    description "A blog article"
    field :id, ID, null: false
    field :title, String, null: false
    field :text, String, null: false
    field :comments, [CommentType], null: true
    field :article_image, String, null: false
    field :created_at, String, null: false
    field :article_thumbnail, String, null: false
    field :slug, String, null: false

    def article_image
      Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)
    end

    def article_thumbnail
      Rails.application.routes.url_helpers.polymorphic_url(object.image.variant(resize: '500x333'), only_path: true)
    end
  end
end