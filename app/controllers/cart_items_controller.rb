class CartItemsController < ApplicationController
  def update_quantity
    cart_item = CartItem.find(params[:id])
    cart_item.update(quantity: params[:quantity])

    respond_to do |format|
      format.json { render json: { total_price: cart_item.product.price * cart_item.quantity, subtotal: @current_cart.total_price } }
    end
  end
end
