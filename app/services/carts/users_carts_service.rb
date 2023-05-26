class Carts::UsersCartsService < Carts::CartsService
  def initialize(cart)
    @cart = cart
  end

  def add_to_cart(id, quantity)
    order = @cart.cart_products.find_by(product: Product.find(id))
    
    if order.present?
      order.quantity += quantity.to_i
      order.save
    else
      CartProduct.create(cart: @cart, product: Product.find(id), quantity: quantity)
    end
  end

  def delete_from_cart(id, quantity)
    order = @cart.cart_products.find_by(product: Product.find(id))
    
    if order.present?
      order.quantity -= quantity.to_i
      if order.quantity <= 0
        order.destroy
      else
        order.save
      end
    end
  end
end
