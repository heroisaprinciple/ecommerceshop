class Product < ApplicationRecord
  before_destroy :not_ref_by_any_cart_prod
  paginates_per 5

  belongs_to :category
  has_many :product_orders
  # has_many :orders, through: :product_orders

  private
  # check if lines are not empty
  def not_ref_by_any_cart_prod
    unless cart_products.empty?
      errors.add(:base, 'Cart products present')
      throw :abort
    end
  end
end
