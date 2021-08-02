# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
1.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               )
end
 User.create(name: "Admin", email: "anadmin@admin.com", password: "myadmin", admin:true)
 10.times do |index|
		Task.create!(
			    task_name: Faker::Lorem.words,
			    description: Faker::Lorem.sentence,
			    status: ["Completed","In progress","Not started"].sample,
			    deadline: time_rand.year.to_s+"/"+time_rand.month.to_s+"/"+time_rand.day.to_s,
			    priority: ["high", "medium","low"].sample,
			    user_id: User.all.pluck(:id).sample,
			)
end

10.times do |id|
	Label.create!(
		      id: id,
		      name: Faker::Verb.past_participle,
		   )
end

10.times do |n|
		Labelling.create!(task_id: rand(1..20), label_id: rand(1..3))
end
