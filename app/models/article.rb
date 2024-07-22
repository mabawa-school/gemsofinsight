class Article < ApplicationRecord
  belongs_to :blog_category
  has_rich_text :body
  has_one_attached :image

  validates :body, presence: true
end
