# == Schema Information
#
# Table name: addresses
#
#  id         :bigint           not null, primary key
#  city       :string
#  comment    :text
#  country    :string
#  street     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_addresses_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :address do
    user { association :user }
    order_detail { association :order_detail, dependent: :destroy }
    country { Faker::Address.country }
    city { Faker::Address.city }
    street { Faker::Address.street_address }
  end
end
