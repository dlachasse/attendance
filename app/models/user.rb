class User < ActiveRecord::Base
	has_many :classroom_periods, through: :schedules
	enum role: { student: 0, teacher: 1, parent: 2, admin: 3 }
end
