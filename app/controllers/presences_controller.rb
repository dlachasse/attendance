class PresencesController < ApplicationController

	def show
		@schedules = Schedule.where(classroom_period_id: params[:id]).pluck(:id)
		@attendance = Presence.where(schedule_id: @schedules)
		respond_with @attendance.to_json
	end
end
