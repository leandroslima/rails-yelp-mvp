# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category = %w(chinese italian japanese french belgian)
Rating = (0..5).to_a

5.times do
  restaurant_example = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: Category.sample
  )

  5.times do
    review = Review.new(
      rating: Rating.sample,
      content: Faker::Restaurant.review
    )
    review.restaurant = restaurant_example
    review.save
  end
end
