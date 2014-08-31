class PresencesController < ApplicationController

	def show
		@schedules = Schedule.where(classroom_period_id: params[:id]).presence
		@attendance = Presence.where(schedule_id: @schedules)
		@attendance = @attendance.map do |a|
			{ recorded: a.created_at.strftime("%Y-%m-%d") }
		end

		respond_with @attendance.to_json
	end

	def class_by_date
		@date = Time.parse("#{params[:date]}")
		@schedules = ClassroomPeriod.find(params[:id]).schedules.pluck(:id)
		@presences = Presence.where(schedule_id: @schedules).where(:created_at => @date.all_day)
		@presences = @presences.map do |p|
			{ attended: p.attended, user: p.schedule.user, recorded: p.created_at.strftime("%Y-%m-%d") }
		end
		respond_with @presences.to_json
	end

	def by_date
		if params[:date]
			@date = Time.parse("#{params[:date]}")
		else
			@date = Time.now
		end
		@presences = Presence.where(:created_at => @date.all_day).map do |p|
			{ attended: p.attended, user: p.schedule.user, recorded: p.created_at.strftime("%Y-%m-%d") }
		end
		respond_with @presences.to_json
	end

end
