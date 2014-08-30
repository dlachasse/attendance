class ClassroomPeriodsController < ApplicationController

	def show
		@classroom_periods = User.find(params[:id]).classroom_periods.map do |cp|
			{id: cp.id, room: cp.room, period: cp.period, teacher: User.find(cp.teacher_id), course_id: cp.course_id}
		end
		respond_with @classroom_periods
	end
end
