class CartProductsController < ApplicationController
  include CartsHelper
  def create
    @product = Product.find(params[:id])
    @cart = load_cart
    # binding.break
    @cart_product = CartProduct.create(cart: @cart, product: @product)
    # binding.break
  end
  def destroy
    @cart = load_cart
    @product = Product.find(params[:id])
    @cart_product = CartProduct.find_by(cart: @cart, product: @product)
    @cart_product.destroy
    redirect_to @cart
  end
end
