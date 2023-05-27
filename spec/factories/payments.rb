# == Schema Information
#
# Table name: payments
#
#  id             :bigint           not null, primary key
#  paid_at        :datetime
#  payment_method :string
#  status         :integer
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
FactoryBot.define do
  factory :payment do
    status { "unpaid" }
    sum { 1.5 }
    payment_method { "card" }
    user { association :user }
    cart { association :cart }
    paid_at { "2023-05-22 09:12:55" }
  end
end
