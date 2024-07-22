class CartsController < ApplicationController
  before_action :set_product, only: [:create, :destroy]
  protect_from_forgery with: :exception
  def create
    @current_cart.cart_items.create(product_id: @product.id)
  end

  def show
  end

  def checkout
  end

  def destroy
    @cart_item = @current_cart.cart_items.find_by_product_id(@product.id)
    @cart_item.destroy
    redirect_to cart_path(@current_cart)
  end

  def success
    if @current_cart.cart_items.any?
      session[:current_cart_id] = nil
    end
    @purchased_cart = Cart.find_by_secret_id(params[:id])
    redirect_to root_path if !@purchased_cart
  end

  def update_quantity
    @cart = Cart.find_by(secret_id: params[:secret_id])
    product = Product.find(params[:product_id])
    cart_item = @cart.cart_items.find_by(product: product)
    cart_item.update(quantity: params[:quantity])

    total_price = cart_item.quantity * product.price
    subtotal = @cart.cart_items.sum { |item| item.quantity * item.product.price }

    render json: { total_price: total_price, subtotal: subtotal }
  end

  private

  def current_cart
    Cart.find_by(secret_id: session[:cart_secret_id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
