class Carts::LocalCartsService < Carts::CartsService
  attr_accessor :local_cart

  # impossible to create a new instance
  private_class_method :new

  # singleton
  def self.instance
    @instance ||= new
  end

  def add_to_cart(id, quantity)
    product_index = find_product_index(id)

    if product_index.present?
      increase_quantity_of_product(product_index, quantity)
    else
      @local_cart << {id: id.to_i, quantity: quantity.to_i}
    end
  end

  def delete_from_cart(id, quantity)
    product_index = find_product_index(id)

    if product_index.present?
      decrease_quantity_of_product(product_index, quantity)

      delete_product(product_index) if @local_cart[product_index][:quantity] <= 0
    end
  end

  private

  def initialize
    @local_cart = []
  end

  def delete_product(product_index)
    @local_cart.delete_at(product_index)
  end

  def decrease_quantity_of_product(product_index, quantity)
    @local_cart[product_index][:quantity] -= quantity.to_i
  end

  def increase_quantity_of_product(product_index, quantity)
    @local_cart[product_index][:quantity] += quantity.to_i
  end

  def find_product_index(id)
    @local_cart.find_index { |product| product[:id] == id }
  end
end
