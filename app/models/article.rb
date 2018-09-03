class Article < ApplicationRecord
  validates :title, :text, presence: true
end
