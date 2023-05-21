# == Schema Information
#
# Table name: product_orders
#
#  id         :bigint           not null, primary key
#  amount     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :bigint           not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_product_orders_on_order_id    (order_id)
#  index_product_orders_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (order_id => orders.id)
#  fk_rails_...  (product_id => products.id)
#
class ProductOrder < ApplicationRecord
  belongs_to :order
  belongs_to :product

  attribute :amount, :integer, default: 1
end
