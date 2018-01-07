# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Create users
10.times do
  User.create!(
    email:    Faker::Internet.unique.email,
    password: Faker::Internet.password
  )
end
users = User.all

# Create wikis
25.times do
  Wiki.create!(
    title:    Faker::StarWars.character,
    body:     Faker::StarWars.quote,
    private:  false,
    user: users.sample
  )
end
wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
