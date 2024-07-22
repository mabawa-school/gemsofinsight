json.extract! admin_blog, :id, :blog_category_id, :title, :content, :created_at, :updated_at
json.url admin_blog_url(admin_blog, format: :json)
json.content admin_blog.content.to_s
