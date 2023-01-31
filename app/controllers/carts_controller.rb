class CartsController < ApplicationController
  include CartsHelper

  def show
    @cart = load_cart
  end

  def destroy
    @cart = load_cart
    @cart.destroy
    redirect_to products_path
  end
end
