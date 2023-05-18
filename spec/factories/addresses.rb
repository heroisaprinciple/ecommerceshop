FactoryBot.define do
  factory :address do
    user { association :user }
    order_detail { association :order_detail, dependent: :destroy }
    country { Faker::Address.country }
    city { Faker::Address.city }
    street { Faker::Address.street_address }
  end
end
