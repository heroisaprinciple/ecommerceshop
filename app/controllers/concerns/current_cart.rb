# frozen_string_literal: true
module CurrentCart
  def set_cart
    @cart = Cart.find(params[:cart_id])
    if @cart.exists?
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
end