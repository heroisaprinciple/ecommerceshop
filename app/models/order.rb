# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  ordered_at :datetime
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  payment_id :bigint           not null
#  user_id    :bigint
#
# Indexes
#
#  index_orders_on_payment_id  (payment_id)
#  index_orders_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (payment_id => payments.id)
#  fk_rails_...  (user_id => users.id)
#
class Order < ApplicationRecord
  enum status: { pending: 0, complete: 1, canceled: 2 }

  belongs_to :user
  has_many :product_orders, dependent: :destroy
  has_many :products, through: :product_orders
  has_one :order_detail, dependent: :destroy

  attribute :status, :string, default: Order.statuses[:pending]

  validates :status, presence: true
  validates :ordered_at, presence: true

  accepts_nested_attributes_for :order_detail
end
