class Schedule < ActiveRecord::Base
	belongs_to :classroom_period
	belongs_to :user
	has_many :presences
end
