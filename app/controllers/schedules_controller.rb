class SchedulesController < ApplicationController

	def index
		@schedules = User.find(params[:id]).schedules
		respond_with @schedules.to_json(except: [:created_at, :updated_at])
	end
end
