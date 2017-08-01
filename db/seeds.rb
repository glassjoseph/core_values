require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
quote = ["Work to become, not to acquire. - Elbert Hubbard",
  "Life is short. Don't be lazy.",
  "Have courage and be kind. - Cinderella 2015",
  "It doesn't really matter who you used to be, what matters is who you've become.",
  "To dare to see is to steal fire from the gods. – White Oleander",
  "I shall allow no man to belittle my soul by making me hate him. – Booker T. Washington",
  "Even our enemy is useful to us because, in order to practice compassion we need to practice tolerance, forgiveness, and patience, the antidotes to anger. – the Dalai Lama",
  "Despair says: I cannot lift that weight. Happiness says, I do not have to. - James Richardson",
  "You gotta take a chance, man. Otherwise, there’ll always be an excuse to hide behind. – One Trick Pony"]

5.times do |n|

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
  user.resources.create(resource_type: "quote", content: quote.sample, notes: "Thinking about this one.")
  user.resources.create(resource_type: "quote", content: quote.sample, notes: "Hmmm...")
  user.resources.create(resource_type: "quote", content: quote.sample, notes: "")
  user.resources.create(resource_type: "quote", content: quote.sample, notes: "")
  user.resources.create(resource_type: "quote", content: quote.sample, notes: "")
  user.resources.create(resource_type: "quote", content: quote.sample, notes: "")


  # user.resources.create(resource_type: "quote", content: )

  supporter = Supporter.create(
           first_name: Faker::LordOfTheRings.character,
           last_name: Faker::LordOfTheRings.character,
           email: Faker::Internet.unique.email,
           user_id: user.id
           )


end

User.last.update_attribute(:email, "n")
