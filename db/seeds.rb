# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")

User.create!(name:  "Another example",
             email: "another@example.com",
             password:              "1234567890",
             password_confirmation: "1234567890")

98.times do |n|
  User.create!(name:  Faker::Name.name,
               email: "example-#{n+1}@railstutorial.org",
               password:              "password",
               password_confirmation: "password")
end
