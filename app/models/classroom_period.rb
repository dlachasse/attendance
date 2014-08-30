class ClassroomPeriod < ActiveRecord::Base
	has_many :presences, through: :schedules
	has_many :students, through: :schedules
	# has_one :teacher_id, foreign_key: 'user_id', class_name: 'users'
end
