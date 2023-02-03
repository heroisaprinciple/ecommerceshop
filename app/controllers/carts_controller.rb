class CartsController < ApplicationController
  def show
    if user_signed_in?
      @cart_products = current_user.cart.cart_products
    elsif session[:product_id]
      @cart_products = Product.where(id: session[:product_id])
    end
  end

  def add_product
    @product = Product.find(params[:id])
    if user_signed_in?
      @cart_product = current_user.cart.cart_products.create(cart_id: current_user.cart, product_id: @product.id)
    else
      if session[:product_id]
        session[:product_id] << params[:id].to_i
      else
        session[:product_id] = [params[:id].to_i]
      end
    end
  end
  def destroy_product
    @product = Product.find(params[:id])
    if user_signed_in?
      @cart_product = current_user.cart.cart_products.find_by(cart_id: current_user.cart, product_id: @product.id)
      @cart_product.destroy
    else
      session[:product_id].delete(params[:id].to_i)
    end
    redirect_to show_cart_path
  end
end
