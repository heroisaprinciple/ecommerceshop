class CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def show

  end

  def new
    @cart = Cart.new
  end
end
