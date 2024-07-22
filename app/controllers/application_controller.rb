class ApplicationController < ActionController::Base
  before_action :set_current_cart
  include Pagy::Backend
  helper_method :current_cart

  def current_cart
    @current_cart ||= begin
      cart = Cart.find_by(id: session[:cart_id]) || Cart.create
      session[:cart_id] = cart.id
      cart
    end
  end

  private

  def set_current_cart
    if session[:current_cart_id]
      @current_cart = Cart.find_by(secret_id: session[:current_cart_id])
      unless @current_cart
        @current_cart = Cart.create
        session[:current_cart_id] = @current_cart.secret_id
      end
    else
      @current_cart = Cart.create
      session[:current_cart_id] = @current_cart.secret_id
    end
  end
end
