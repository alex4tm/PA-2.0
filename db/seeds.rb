# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

puts "Cleaning existing bookings..."
Booking.destroy_all

 Restaurant.create(
      name: 'Zuma',
      address: 'Down town - Dubai',
      tables_capacity: 4,
      category: 'Seafood',
      rating: 5
    )

puts 'Zuma restaurant created'


puts 'creating 7 bookings'
7.times do
    booking = Booking.new(
      notes: Faker::Quotes::Shakespeare,
      start_date: Date.today + rand(1..10).days,
      number_of_guests: [1, 2, 3, 4, 5, 6, 7].sample,
      user: User.first,
      restaurant: Restaurant.first
    )
    booking.save
end

puts '7 bookings created'
