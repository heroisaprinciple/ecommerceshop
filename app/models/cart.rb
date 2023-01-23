class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products
  # has_many :product_orders

  def add_product(product)
    current_item = cart_products.find_by(product_id: product.id)
    if current_item
      # current_item = product_orders.increment_counter(:quantity, product_orders.id)
      # must add 1 to quantity to order_prods
      current_item
    else
      current_item = cart_products.build(product_id: product.id)
    end
    current_item
  end
end
