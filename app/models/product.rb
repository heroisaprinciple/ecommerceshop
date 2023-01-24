class Product < ApplicationRecord
  paginates_per 5

  belongs_to :category
  has_many :product_orders
  # has_many :orders, through: :product_orders

end
