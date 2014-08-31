namespace :data do

	desc "Populate database with test data"
	task populate: :environment do
		Course.populate(6) do |course|
			course.title = Faker::Team.name
			course.description = Faker::Lorem.sentences(5)
			course.excerpt = Faker::Lorem.sentences(1)
		end

		User.populate(5) do |teach|
			teach.first_name = Faker::Name.first_name
			teach.last_name = Faker::Name.last_name
			teach.email = Faker::Internet.email
			teach.avatar = "/img/kitten-#{Faker::Number.number(1)}.jpg"
			teach.role = 1
			course = 0

			ClassroomPeriod.populate(3) do |crp|
				course += 1
				crp.teacher_id = teach.id
				crp.course_id = course
				crp.period = course
				crp.room = Faker::Team.creature
			end

		end

		User.populate(50) do |user|
			user.first_name = Faker::Name.first_name
			user.last_name = Faker::Name.last_name
			user.email = Faker::Internet.email
			user.avatar = "/img/kitten-#{Faker::Number.number(1)}.jpg"
			user.role = 0

			Schedule.populate(6) do |schedule|
				schedule.classroom_period_id = rand(1..15)
				schedule.user_id = user.id

				Presence.populate(6) do |presence|
					presence.attended = true
					presence.schedule_id = schedule.id
				end
			end

		end



	end

end
