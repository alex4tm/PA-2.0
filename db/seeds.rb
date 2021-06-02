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

zuma = Restaurant.new(
  name: 'Zuma',
  address: 'DIFC- Dubai',
  tables_capacity: 4,
  category: 'Japanese',
  rating: 5
  )
file = URI.open('https://images.unsplash.com/photo-1514933651103-005eec06c04b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1867&q=80')
zuma.photo.attach(io: file, filename: 'restaurant.png', content_type: 'image/png')
zuma.save!


al_muntaha = Restaurant.new(
  name: 'Al Muntaha',
  address: 'Burj Al Arab - Dubai',
  tables_capacity: 10,
  category: 'International',
  rating: 5
  )
file = URI.open('https://www.timeoutdubai.com/public/styles/full_img/public/images/2014/12/04/2014_almuntahaburnch_base.jpg?itok=UD5E5sCm')
al_muntaha.photo.attach(io: file, filename: 'restaurant.png', content_type: 'image/png')
al_muntaha.save!



la_serre = Restaurant.new(
  name: 'La Serre',
  address: 'Downtown - Dubai',
  tables_capacity: 6,
  category: 'French',
  rating: 5
  )
file = URI.open('https://www.caterermiddleeast.com/public/images/2019/05/20/spring2.jpg')
la_serre.photo.attach(io: file, filename: 'restaurant.png', content_type: 'image/png')
la_serre.save!



il_borro = Restaurant.new(
  name: 'Il Borro Tuscan Bistro',
  address: 'Jumeirah Al Naseem - Dubai',
  tables_capacity: 15,
  category: 'Italian',
  rating: 5
  )
file = URI.open('https://eatapp.co/dubai-restaurants/images/il-borro-tuscan-bistro-madinat-jumeirah-restaurant-1.jpg')
il_borro.photo.attach(io: file, filename: 'restaurant.png', content_type: 'image/png')
il_borro.save!



ossiano = Restaurant.new(
  name: 'Ossiano',
  address: 'The Palm Jumeirah - Dubai',
  tables_capacity: 4,
  category: 'Seafood',
  rating: 5
  )
file = URI.open('https://whatson.ae/wp-content/uploads/2018/02/sliderossiano11-300x203.jpg')
ossiano.photo.attach(io: file, filename: 'restaurant.png', content_type: 'image/png')
ossiano.save!






User.create!(
  email: "user@gmail.com",
  password: "123456",
  first_name: "Jane",
  last_name: "Smith",
  username: "Jane S.",
  secure_id: "abcd12",
  phone_number: "+971507207651"
  )

User.create!(
  email: "restaurant@gmail.com",
  password: "123456",
  first_name: "Alex",
  last_name: "Iliesi",
  username: "Alex I.",
  secure_id: "",
  phone_number: "+971507207650",
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

allergies = Category.create!(
  user: User.first,
  name: "Allergies"
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
  category: allergies,
  name: "Dairy",
  description: "severe reaction"
  )

Preference.create!(
  category: allergies,
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
  name: "Red Wine",
  description: "Ribera del Duero"
  )

Preference.create!(
  category: drinks,
  name: "Cocktails",
  description: "Negroni"
  )

Preference.create!(
  category: food,
  name: "Bread",
  description: "Wholegrain Gluten free"
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
