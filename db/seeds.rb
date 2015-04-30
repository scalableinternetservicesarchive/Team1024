# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
   # User example: u = User.create(:email => "user@name.com", :password => 'password', :password_confirmation => 'password')

   user_a = User.create(email: 'ua@b.c', password: 'ua', password_confirmation: 'ua')
   user_b = User.create(email: 'ub@b.c', password: 'ub', password_confirmation: 'ub')

   manager_a = User.create(email: 'ma@b.c', password: 'ma', password_confirmation: 'ma')
   manager_b = User.create(email: 'mb@b.c', password: 'mb', password_confirmation: 'mb')

   event_1 = Event.create(name: 'event_1', max_attendance: 100, start_time: DateTime.new(2015,6,1), create_time: DateTime.new(2015,4,1), description: "text seed event 2")
   event_2 = Event.create(name: 'event_2', max_attendance: 500, start_time: DateTime.new(2015,6,10), create_time: DateTime.new(2015,4,1), description: "text seed event 1")

