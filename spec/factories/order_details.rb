# == Schema Information
#
# Table name: order_details
#
#  id         :bigint           not null, primary key
#  email      :string
#  firstname  :string
#  lastname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address_id :bigint           not null
#  order_id   :bigint           not null
#
# Indexes
#
#  index_order_details_on_address_id  (address_id)
#  index_order_details_on_order_id    (order_id)
#
# Foreign Keys
#
#  fk_rails_...  (address_id => addresses.id)
#  fk_rails_...  (order_id => orders.id)
#
FactoryBot.define do
  factory :order_detail do
    product { association :order }
    cart { association :address }
    quantity { 1 }
  end
end
