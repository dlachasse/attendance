class PresencesController < ApplicationController

	def show
		@schedules = Schedule.where(classroom_period_id: params[:id]).pluck(:id)
		@attendance = Presence.where(schedule_id: @schedules)
		@course = Course.find(ClassroomPeriod.find(params[:id]).course_id)
		@attendance = @attendance.map do |a|
			{ id: a.id, title: @course.title, recorded: a.created_at.strftime("%Y-%m-%d") }
		end

		respond_with @attendance.to_json
	end
end
