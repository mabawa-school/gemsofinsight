require "application_system_test_case"

class Admin::BlogCategoriesTest < ApplicationSystemTestCase
  setup do
    @admin_blog_category = admin_blog_categories(:one)
  end

  test "visiting the index" do
    visit admin_blog_categories_url
    assert_selector "h1", text: "Blog categories"
  end

  test "should create blog category" do
    visit admin_blog_categories_url
    click_on "New blog category"

    fill_in "Description", with: @admin_blog_category.description
    fill_in "Name", with: @admin_blog_category.name
    click_on "Create Blog category"

    assert_text "Blog category was successfully created"
    click_on "Back"
  end

  test "should update Blog category" do
    visit admin_blog_category_url(@admin_blog_category)
    click_on "Edit this blog category", match: :first

    fill_in "Description", with: @admin_blog_category.description
    fill_in "Name", with: @admin_blog_category.name
    click_on "Update Blog category"

    assert_text "Blog category was successfully updated"
    click_on "Back"
  end

  test "should destroy Blog category" do
    visit admin_blog_category_url(@admin_blog_category)
    click_on "Destroy this blog category", match: :first

    assert_text "Blog category was successfully destroyed"
  end
end
