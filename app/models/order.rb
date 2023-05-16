# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  ordered_at :datetime
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :product_orders, dependent: :destroy
  has_many :products, through: :product_orders
  has_one :order_detail, dependent: :destroy

  attribute :status, :string, default: 'processing'

  accepts_nested_attributes_for :order_detail
end
