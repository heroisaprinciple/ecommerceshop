# == Schema Information
#
# Table name: products
#
#  id              :bigint           not null, primary key
#  description     :string
#  name            :string
#  position        :integer
#  price           :decimal(, )
#  slug            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category_id     :bigint
#  stripe_price_id :string
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#  index_products_on_slug         (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
FactoryBot.define do
  factory :product do
    category { association :category }
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph(sentence_count: 1) }
    price { Faker::Commerce.unique.price }

    trait :sleek_concrete_watch do
      name { "Sleek Concrete Watch" }
      description { Faker::Lorem.paragraph(sentence_count: 1) }
      price { Faker::Commerce.unique.price }
    end

    trait :mediocre_wooden_chair do
      name { "Mediocre Wooden Chair" }
      description { Faker::Lorem.paragraph(sentence_count: 1) }
      price { Faker::Commerce.unique.price }
    end

    trait :invalid do
      name { "" }
    end
  end
end
