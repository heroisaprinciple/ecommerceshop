class Product < ApplicationRecord
  paginates_per 6

  belongs_to :category
  has_many :product_orders, dependent: :destroy
  has_many :orders, through: :product_orders, dependent: :destroy

  scope :paginate_order, -> {select("*")}
end
