require "application_system_test_case"

class Admin::BlogsTest < ApplicationSystemTestCase
  setup do
    @admin_blog = admin_blogs(:one)
  end

  test "visiting the index" do
    visit admin_blogs_url
    assert_selector "h1", text: "Blogs"
  end

  test "should create blog" do
    visit admin_blogs_url
    click_on "New blog"

    fill_in "Blog category", with: @admin_blog.blog_category_id
    fill_in "Title", with: @admin_blog.title
    click_on "Create Blog"

    assert_text "Blog was successfully created"
    click_on "Back"
  end

  test "should update Blog" do
    visit admin_blog_url(@admin_blog)
    click_on "Edit this blog", match: :first

    fill_in "Blog category", with: @admin_blog.blog_category_id
    fill_in "Title", with: @admin_blog.title
    click_on "Update Blog"

    assert_text "Blog was successfully updated"
    click_on "Back"
  end

  test "should destroy Blog" do
    visit admin_blog_url(@admin_blog)
    click_on "Destroy this blog", match: :first

    assert_text "Blog was successfully destroyed"
  end
end
