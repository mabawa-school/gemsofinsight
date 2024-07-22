class Admin::BlogsController < ApplicationController
  layout 'admin'
  # before_action :set_blog_category
  before_action :set_admin_blog, only: %i[ show edit update destroy ]

  # GET /admin/blogs or /admin/blogs.json
  def index
    @admin_blogs = Blog.where(blog_category_id: params[:blog_category_id])
    # @admin_stocks = Stock.where(product_id: params[:product_id])
  end

  # GET /admin/blogs/1 or /admin/blogs/1.json
  def show
  end

  # GET /admin/blogs/new
  def new
    @blog_category = BlogCategory.find(params[:blog_category_id])
    @admin_blog = Blog.new
  end

  # GET /admin/blogs/1/edit
  def edit
    @blog_category = BlogCategory.find(params[:blog_category_id])
    @admin_blog = Blog.find(params[:id])
  end

  # POST /admin/blogs or /admin/blogs.json
  def create
    @blog_category = BlogCategory.find(params[:blog_category_id])
    @admin_blog = @blog_category.blogs.new(admin_blog_params)

    respond_to do |format|
      if @admin_blog.save
        format.html { redirect_to admin_blog_category_blog_url(@blog_category, @admin_blog), notice: "Blog was successfully created." }
        format.json { render :show, status: :created, location: @admin_blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/blogs/1 or /admin/blogs/1.json
  def update
    respond_to do |format|
      if @admin_blog.update(admin_blog_params)
        format.html { redirect_to admin_blog_category_blog_url(@admin_blog.blog_category, @admin_blog), notice: "Blog was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/blogs/1 or /admin/blogs/1.json
  def destroy
    @admin_blog.destroy!

    respond_to do |format|
      format.html { redirect_to admin_blog_category_blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_blog_category
    #   @blog_category = BlogCategory.find_by(id: params[:blog_category_id])
    #   redirect_to admin_blog_categories_path, alert: "Blog category not found" unless @blog_category
    # end

    def set_admin_blog
      @admin_blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_blog_params
      params.require(:blog).permit(:blog_category_id, :title, :content, :image)
    end
end
