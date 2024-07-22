require "test_helper"

class Admin::BlogCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_blog_category = admin_blog_categories(:one)
  end

  test "should get index" do
    get admin_blog_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_blog_category_url
    assert_response :success
  end

  test "should create admin_blog_category" do
    assert_difference("Admin::BlogCategory.count") do
      post admin_blog_categories_url, params: { admin_blog_category: { description: @admin_blog_category.description, name: @admin_blog_category.name } }
    end

    assert_redirected_to admin_blog_category_url(Admin::BlogCategory.last)
  end

  test "should show admin_blog_category" do
    get admin_blog_category_url(@admin_blog_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_blog_category_url(@admin_blog_category)
    assert_response :success
  end

  test "should update admin_blog_category" do
    patch admin_blog_category_url(@admin_blog_category), params: { admin_blog_category: { description: @admin_blog_category.description, name: @admin_blog_category.name } }
    assert_redirected_to admin_blog_category_url(@admin_blog_category)
  end

  test "should destroy admin_blog_category" do
    assert_difference("Admin::BlogCategory.count", -1) do
      delete admin_blog_category_url(@admin_blog_category)
    end

    assert_redirected_to admin_blog_categories_url
  end
end
