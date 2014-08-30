class User < ActiveRecord::Base
	has_many :classroom_periods, through: :schedules
	has_many :schedules
	enum role: [ :student, :teacher ]
end
