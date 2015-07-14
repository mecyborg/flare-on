# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
3.times do |n|
  first_name  = Faker::Name.first_name
  last_name  = Faker::Name.last_name
  email = "example-#{n + 1}@ideabata.com"
  profile_name = Faker::Internet.user_name
  bio = Faker::Name.title
  password = 'password'
  User.create!(first_name: first_name,
  				         last_name: last_name,
               email: email,
               profile_name: profile_name,
               bio: bio,
               password:              password
              )
end
