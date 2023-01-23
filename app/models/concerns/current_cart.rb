# frozen_string_literal: true

# might be added to models and controllers
# module CurrentCart
# private
# def set_cart
# @carts = Cart.find(session[:cart_id])
# rescue ActiveRecordError::RecordNotFound
# @carts = Cart.create
# session[:cart_id] = @carts.id
# end
# end