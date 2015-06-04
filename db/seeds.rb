# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create 100 users
10000.times do |n|
  User.create!(id: n+101, email: "test#{n+101}@test.com", password: 'password', password_confirmation: 'password')
  #Manager.create!(email: "test#{n+201}@test.com", password: 'password', password_confirmation: 'password')
  #puts "Created user: test#{n}@test.com"
end
puts "Number of users: #{User.count}"
#puts "Number of managers: #{Manager.count}"

manager_a = Manager.create(email: 'a@b.c', password: 'password', password_confirmation: 'password')

event_1 = manager_a.events.create(name: 'event_1', max_attendance: 100, start_time: DateTime.new(2015,6,1), create_time: DateTime.new(2015,4,1), description: "text seed event 1")


# create a test event with two pictures
#event_1 = Event.create(name: 'event_1', max_attendance: 100, start_time: DateTime.new(2015,6,1), create_time: DateTime.new(2015,4,1), description: "text seed event 1")
event_1_pic_1 = EventPicture.create!(:event => event_1)
event_1_pic_1.image.store!(File.open("#{Rails.root}/public/uploads/seed_pic/jm1.jpg"))
event_1.event_pictures << event_1_pic_1
event_1.save!
event_1_pic_2 = EventPicture.create!(:event => event_1)
event_1_pic_2.image.store!(File.open("#{Rails.root}/public/uploads/seed_pic/jm2.jpg"))
event_1.event_pictures << event_1_pic_2
event_1.save!

# create a test event with no pictures
event_2 = manager_a.events.create(name: 'event_2', max_attendance: 100, start_time: DateTime.new(2015,5,25), create_time: DateTime.new(2015,4,1), description: "text seed event 2")
