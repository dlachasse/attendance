class UsersController < ApplicationController
	respond_to :json

	def show
		@user = User.find(params[:id])
		respond_with @user.to_json(except: [:created_at, :updated_at])
	end
end
