class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		respond_with @user.to_json(except: [:created_at, :updated_at])
	end

	def index
		@users = User.all
		respond_with @users.to_json(except: [:created_at, :updated_at])
	end
end
