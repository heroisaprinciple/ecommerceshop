FactoryBot.define do
  factory :cart do
    user { association :user }
  end
end