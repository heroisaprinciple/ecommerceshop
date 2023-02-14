class CartsController < ApplicationController
  def show
    @cart_products = resource
  end

  def add_product
    if user_signed_in?
      current_user.cart.products << Product.find(params[:id]) #
    else
      if session[:product_ids].present?
        session[:product_ids] << params[:id].to_i
      else
        session[:product_ids] = [params[:id].to_i]
      end
    end
  end
  def destroy_product
    if user_signed_in?
      current_user.cart.products.destroy(params[:id])
    else
      session[:product_ids].delete(params[:id].to_i)
    end
    redirect_to show_cart_path
  end

  private
  def resource
    if user_signed_in?
      current_user.cart.products
    elsif session[:product_ids].present?
      Product.where(id: session[:product_ids])
    end
  end
end