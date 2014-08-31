class ClassroomPeriodsController < ApplicationController

	def schedule
		@classroom_periods = User.find(params[:id]).classroom_periods.map do |cp|
			{id: cp.id, title: Course.find(cp.course_id).title, room: cp.room, period: cp.period,  teacher: User.find(cp.teacher_id), course_id: cp.course_id}
		end
		respond_with @classroom_periods
	end

	def listing
		@cp = ClassroomPeriod.find(params[:id])
		@course = Course.find(@cp.course_id)
		@students = @cp.users
		@classroom_period = {id: @cp.id, title: @course.title, room: @cp.room, excerpt: @course.excerpt, description: @course.description, period: @cp.period, teacher: User.find(@cp.teacher_id), students: @students}
		respond_with @classroom_period
	end

	def index
		@cp = ClassroomPeriod.all
		@classroom_periods = @cp.map do |cp|
			{id: cp.id, title: Course.find(cp.course_id).title, period: cp.period, teacher: User.find(cp.teacher_id) }
		end
		respond_with @classroom_periods
	end

end
