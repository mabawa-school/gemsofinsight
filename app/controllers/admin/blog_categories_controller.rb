class Admin::BlogCategoriesController < AdminController
  layout 'admin'
  before_action :set_admin_blog_category, only: %i[ show edit update destroy ]

  # GET /admin/categories or /admin/categories.json
  def index
    @admin_blog_categories = BlogCategory.all
  end

  # GET /admin/categories/1 or /admin/categories/1.json
  def show
  end

  # GET /admin/categories/new
  def new
    @admin_blog_category = BlogCategory.new
  end

  # GET /admin/categories/1/edit
  def edit
  end

  # POST /admin/categories or /admin/categories.json
  def create
    @admin_blog_category = BlogCategory.new(admin_blog_category_params)

    respond_to do |format|
      if @admin_blog_category.save
        format.html { redirect_to admin_blog_category_url(@admin_blog_category), notice: "Blog Category was successfully created." }
        format.json { render :show, status: :created, location: @admin_blog_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_blog_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/categories/1 or /admin/categories/1.json
  def update
    respond_to do |format|
      if @admin_blog_category.update(admin_blog_category_params)
        format.html { redirect_to admin_blog_category_url(@admin_blog_category), notice: "Blog Category was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_blog_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_blog_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/categories/1 or /admin/categories/1.json
  def destroy
    @admin_blog_category.destroy!

    respond_to do |format|
      format.html { redirect_to admin_blog_categories_url, notice: "Blog Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_blog_category
      @admin_blog_category = BlogCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_blog_category_params
      params.require(:blog_category).permit(:name, :description, :image)
    end
end
