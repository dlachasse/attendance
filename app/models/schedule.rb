class Schedule < ActiveRecord::Base
	belongs_to :classroom_period
	belongs_to :user
end
