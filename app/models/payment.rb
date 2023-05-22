# == Schema Information
#
# Table name: payments
#
#  id             :bigint           not null, primary key
#  paid_at        :datetime
#  payment_method :string
#  status         :string
#  sum            :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  cart_id        :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_payments_on_cart_id  (cart_id)
#  index_payments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#  fk_rails_...  (user_id => users.id)
#
class Payment < ApplicationRecord
  enum status: { unpaid: 0, paid: 1, canceled: 2 }

  belongs_to :user
  belongs_to :cart

  validates :status, presence: true
  validates :paid_at, presence: true
  validates :sum, presence: true
end
