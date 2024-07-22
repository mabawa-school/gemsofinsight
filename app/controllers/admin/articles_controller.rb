class Admin::ArticlesController < ApplicationController
  layout 'admin'
  before_action :set_admin_article, only: %i[ show edit update destroy ]

  # GET /admin/articles or /admin/articles.json
  def index
    @admin_articles = Article.all
  end

  # GET /admin/articles/1 or /admin/articles/1.json
  def show
  end

  # GET /admin/articles/new
  def new
    @admin_article = Article.new
  end

  # GET /admin/articles/1/edit
  def edit
  end

  # POST /admin/articles or /admin/articles.json
  def create
    @admin_article = Article.new(admin_article_params)

    respond_to do |format|
      if @admin_article.save
        format.html { redirect_to admin_article_url(@admin_article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @admin_article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/articles/1 or /admin/articles/1.json
  def update
    respond_to do |format|
      if @admin_article.update(admin_article_params)
        format.html { redirect_to admin_article_url(@admin_article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/articles/1 or /admin/articles/1.json
  def destroy
    @admin_article.destroy!

    respond_to do |format|
      format.html { redirect_to admin_articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_article
      @admin_article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_article_params
      params.require(:admin_article).permit(:blog_category_id, :title, :body, :image)
    end
end
