class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			redirect_to login_path, notice: "Registered Successfully..."
		else
			render action: :new, error: "Registration failed"
		end	
	end
end