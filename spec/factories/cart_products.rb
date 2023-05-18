FactoryBot.define do
  factory :cart_product do
    product { association :product }
    cart { association :cart }
    quantity { 1 }
  end
end
