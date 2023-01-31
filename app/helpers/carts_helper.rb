module CartsHelper
  def load_cart
    if user_signed_in?
      if current_user.cart.present?
        @cart = current_user.cart
      else
        @cart = Cart.create(user: current_user)
        # updating the current user after changes
        current_user.update(cart: @cart)
      end

    else
      if session[:cart]
        @cart = session[:cart]
      else
        @cart = Cart.create
        session[:cart] = @cart
      end
    end
    @cart
  end
end
