class SessionsController < ApplicationController

	def new
	end
	
	def create
		@user = User.find_by_username(params[:username])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			if session[:create_post_clicked]
				redirect_to new_post_path, notice: "Start Selling yourself " + current_user.firstname
			else	
				redirect_to root_path
			end	
		else
			flash[:error] = "couldn't log in the user"
			render action: "new"
		end	
	end

	def destroy
		session[:user_id] = nil
		session[:create_post_clicked] = nil
		redirect_to root_path
	end

end

