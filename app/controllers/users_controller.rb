class UsersController < ApplicationController

	before_filter :require_login, only: [:show]

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if User.where(username: @user.username).first.nil?
			if @user.save
				redirect_to login_path, notice: "Registered Successfully..."
			else
				render action: :new, error: "Registration failed"
			end	
		else
			render :new, error: "username is already being taken!"
		end	
		
	end

	def show
		@user = User.find(params[:id])
		#@posts = Post.where(:user_id => current_user.id).limit(10).order("created_at DESC")
		@posts = Post.where(:user_id => @user).limit(10).order("created_at DESC")
		@comments = Comment.where(:user_id => @user).limit(5).order("created_at DESC")
		@votes = Vote.where(:user_id => @user).limit(10).order("created_at DESC")
	end

	def edit
	
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			redirect_to user_path(current_user), notice: "Updated successfully"
		else
			render "edit", error: "There might be some problem updating it now"
		end		
	end

end