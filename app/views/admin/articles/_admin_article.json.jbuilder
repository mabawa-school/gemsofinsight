json.extract! admin_article, :id, :blog_category_id, :title, :body, :image, :created_at, :updated_at
json.url admin_article_url(admin_article, format: :json)
json.body admin_article.body.to_s
json.image url_for(admin_article.image)
