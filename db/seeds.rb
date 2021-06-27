# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  User.create!(
    email: "test#{n+1}@test.com",
    user_name: "test君#{n+1}",
    password: "#{n+1}#{n+1}#{n+1}#{n+1}#{n+1}#{n+1}"
  )
end

User.all.each do |user|
  user.posts.create!(
    title: "山陰旅行一周旅行！"
  )
end