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
require 'rails_helper'

RSpec.describe Payment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
