class Blog < ApplicationRecord
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [50, 50]
  end
  
  belongs_to :blog_category
  has_rich_text :content
end
