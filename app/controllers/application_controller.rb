class ApplicationController < ActionController::Base

	helper_method :current_user, :logged_in?, :create_post_handler, :create_comments_handler, :find_user_details_from_session_id
	protect_from_forgery

	def current_user
		session[:user_id]
	end

	def logged_in?
		!!current_user
	end

	def create_post_handler
		if !logged_in?
			session[:create_post_clicked] = true
			redirect_to login_path
		end
	end

	def create_comments_handler
		if !logged_in?
			redirect_to login_path
		end
	end

	def require_login
		if !logged_in?
			redirect_to root_path, notice: "You need to login to perform this!"
		end	
	end

	def find_user_details_from_session_id
		user_details = Array.new
		user_details << User.find(session[:user_id]).firstname << User.find(session[:user_id]).username
	end 

end
