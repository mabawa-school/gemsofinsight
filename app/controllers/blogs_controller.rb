class BlogsController < ApplicationController
  def show
    @blog = Blog.find(params[:id])
    @blogs = Blog.where(blog_category_id: @blog.blog_category_id)
  end
end
