# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

puts "D E L E T I N G   E V E R Y T H I N G !!!"
Booking.destroy_all
User.destroy_all
Restaurant.destroy_all

Restaurant.create!(
  name: 'Zuma',
  address: 'Down town - Dubai',
  tables_capacity: 4,
  category: 'Japanese',
  rating: 5
  )

Restaurant.create!(
  name: 'Al Muntaha',
  address: 'Burj Al Arab - Dubai',
  tables_capacity: 10,
  category: 'International',
  rating: 5
  )

User.create!(
  email: "user@gmail.com",
  password: "123456",
  first_name: "Lexi",
  last_name: "Claudia",
  username: "Lexi C.",
  secure_id: "abcd12",
  phone_number: "+971562721100"
  )

User.create!(
  email: "restaurant@gmail.com",
  password: "123456",
  first_name: "Alex",
  last_name: "Iliesi",
  username: "Alex I.",
  secure_id: "",
  phone_number: "+971507207651",
  restaurant: Restaurant.first
  )

User.create!(
  email: "user1@gmail.com",
  password: "123456",
  first_name: "Paul",
  last_name: "Smith",
  username: "Paul S.",
  secure_id: "abcd12",
  phone_number: "+971562721100"
  )

User.create!(
  email: "user2@gmail.com",
  password: "123456",
  first_name: "Maria",
  last_name: "Walton",
  username: "Maria W.",
  secure_id: "abcd12",
  phone_number: "+971562721100"
  )

alergies = Category.create!(
  user: User.first,
  name: "Alergies"
  )

drinks = Category.create!(
  user: User.first,
  name: "Drinks"
  )

food = Category.create!(
  user: User.first,
  name: "Food"
  )

seating = Category.create!(
  user: User.first,
  name: "Seating"
  )

Preference.create!(
  category: alergies,
  name: "Seafood",
  description: "severe reaction"
  )

Preference.create!(
  category: alergies,
  name: "Gluten",
  description: "mild reaction"
  )

Preference.create!(
  category: drinks,
  name: "Coke/pepsi",
  description: "diet only - plenty of ice"
  )

Preference.create!(
  category: drinks,
  name: "Water",
  description: "Sparkling - Perrier"
  )

Preference.create!(
  category: drinks,
  name: "Champagne",
  description: "Dom Perignon / Moet - Rose"
  )

Preference.create!(
  category: drinks,
  name: "Cocktails",
  description: "Caipirinha"
  )

Preference.create!(
  category: food,
  name: "Bread",
  description: "Wholegrain"
  )

Preference.create!(
  category: food,
  name: "Steak",
  description: "medium-rare"
  )

Preference.create!(
  category: food,
  name: "Salads",
  description: "dressing on the side"
  )

Preference.create!(
  category: seating,
  name: "Terrace",
  description: "outdoor seating if available"
  )

Preference.create!(
  category: seating,
  name: "Table spot",
  description: "away from live band"
  )
NOTES = ['Do not present alcohol menu', 'Quick business meeting', 'Terrace table preffered', 'Away from the live band please', 'Might need to accommodate 2 children', 'Possible late arrival 10minutes']
    9.times do
    booking = Booking.new(
    notes: NOTES.sample,
    start_date: Faker::Time.forward(days: 10, period: :evening),
    number_of_guests: [1, 2, 3, 4, 5, 6, 7].sample,
    user: User.where(restaurant: nil).sample,
    restaurant: Restaurant.all.sample
    )
  booking.save
end

puts "all good :)"
