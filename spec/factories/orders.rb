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
FactoryBot.define do
  factory :order do
    user { association :user }
    payment { association :payment }
    status { Order.statuses[:pending] }
    ordered_at { Time.current }
  end
end
