# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create 100 users
100.times do |n|
  User.create!(id: n, email: "test#{n}@test.com", password: 'password', password_confirmation: 'password')
  #puts "Created user: test#{n}@test.com"
end
puts "Number of users: #{User.count}"


manager_a = Manager.create(email: 'a@b.c', password: 'password', password_confirmation: 'password')

event_1 = Event.create(name: 'event_1', max_attendance: 100, start_time: DateTime.new(2015,6,1), create_time: DateTime.new(2015,4,1), description: "text seed event 1")
