FactoryBot.define do
  factory :order_detail do
    product { association :order }
    cart { association :address }
    quantity { 1 }
  end
end
