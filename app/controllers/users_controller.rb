class UsersController < ApplicationController

	before_filter :require_login, only: [:show]

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

	def show
		@posts = Post.where(:user_id => current_user.id).limit(10).order("created_at DESC")
		@comments = Comment.where(:user_id => current_user.id).limit(5).order("created_at DESC")
		@votes = Vote.where(:user_id => current_user.id).limit(10).order("created_at DESC")
	end

end