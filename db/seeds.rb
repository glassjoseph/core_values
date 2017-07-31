require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do |n|

  user = User.create!(first_name: Faker::LordOfTheRings.character,
           last_name: Faker::LordOfTheRings.character,
           email: Faker::Internet.unique.email,
           password: "password")
  user.dailies.create!(goal: "Exercise?")
  user.dailies.create!(goal: "Strengthen a relationship?")
  user.dailies.create!(goal: "Study effectively?")
  user.dailies.create!(goal: "Be patient?")

  user.dailies.each do |daily|
    daily.scores.create!(score: (rand(10) + 1 ), date: 1.day.ago.to_date)
    daily.scores.create!(score: (rand(10) + 1 ), date: 2.days.ago.to_date)
    daily.scores.create!(score: (rand(10) + 1 ), date: 3.days.ago.to_date)
    daily.scores.create!(score: (rand(10) + 1 ), date: 4.days.ago.to_date)
    daily.scores.create!(score: (rand(10) + 1 ), date: 5.days.ago.to_date)
    daily.scores.create!(score: (rand(10) + 1 ), date: 6.days.ago.to_date)
    daily.scores.create!(score: (rand(10) + 1 ), date: 7.days.ago.to_date)
  end

  user.resources.create(resource_type: "image", content: "http://static.boredpanda.com/blog/wp-content/uploads/2015/09/cute-bunnies-25__605.jpg", notes: "Adorable")
  user.resources.create(resource_type: "image", content: "http://static.boredpanda.com/blog/wp-content/uploads/2015/09/cute-bunnies-28__605.jpg", notes: "Super Adorable")

  Supporter.create(
           first_name: Faker::LordOfTheRings.character,
           last_name: Faker::LordOfTheRings.character,
           email: Faker::Internet.unique.email,
           )


end

User.last.update_attribute(:email, "n")
