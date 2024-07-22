class BlogCategoriesController < ApplicationController
  def index
    @blog_categories = BlogCategory.all
  end

  def show
    @blog_category = BlogCategory.find(params[:id])
    @blogs = @blog_category.blogs
  end
end
