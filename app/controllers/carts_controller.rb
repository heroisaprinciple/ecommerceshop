class CartsController < ApplicationController

  def show
    add_to_cart
  end
  def create
    add_to_cart
  end

  private
  def add_to_cart
    @product = Product.find(params[:id])
    if current_user # user.signed_in?
      @current_cart_prod = CartProduct.new(cart_id: current_user.cart, product_id: @product)
      unless @current_cart_prod.empty?
        @current_cart_prod.save!
      end

    else
      initialize_session
      load_cart
      session[:cart] << @product unless session[:cart].include?(@product)
      redirect_to products_path
    end
  end

  def initialize_session
    session[:cart] ||= [] # empty cart => empty array
  end

  def load_cart
    @cart = Product.find(session[:cart])
  end

end
