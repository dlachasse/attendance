class User < ActiveRecord::Base
	has_many :classroom_periods, through: :schedules
end
