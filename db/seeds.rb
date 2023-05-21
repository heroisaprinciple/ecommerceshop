# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
categories = Category.create([
                               { priority: Faker::Number.number(digits: 2) },
                               { priority: Faker::Number.number(digits: 2) },
                               { priority: Faker::Number.number(digits: 2) }
                             ])

10.times do
  Product.create!(
    name: Faker::Commerce.unique.product_name,
    price: Faker::Commerce.unique.price,
    description: Faker::Lorem.paragraph(sentence_count: 1),
    category: categories.sample
  )
end
