# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  priority   :integer
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_slug  (slug) UNIQUE
#

FactoryBot.define do
  factory :category do
    name { "Home" }
    priority { Faker::Number.number(digits: 2) }

    trait :home do
      name { "Home" }
    end

    trait :clothes do
      name { "Clothes" }
    end

    trait :other do
      name { "Other" }
    end

    trait :invalid do
      name { "" }
    end
  end
end


