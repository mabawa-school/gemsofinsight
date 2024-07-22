class HomeController < ApplicationController
  def index
    @desktop_carousel_images = ["image1.jpg", "image2.jpg", "image3.jpg"]
    @mobile_carousel_images = ["mobile_image1.jpg", "mobile_image2.jpg", "mobile_image3.jpg"]
    @main_products = Product.take(6)
    @main_categories = Category.take(4)
    @main_blog_categories = BlogCategory.take(4)
  end
end
