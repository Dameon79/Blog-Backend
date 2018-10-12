class Comment < ApplicationRecord
  validates :name, :body, presence: true
  belongs_to :article
end