class ApplicationController < ActionController::Base

	helper_method :current_user, :logged_in?, :create_post_handler
	protect_from_forgery

	def current_user
		session[:user]
	end

	def logged_in?
		!!current_user
	end

	def create_post_handler
		if !logged_in?
			session[:create_post_clicked] = true
			redirect_to login_path
		else
				
		end
	end

	def require_login
		if !logged_in?
			redirect_to root_path, notice: "You need to login to perform this!"
		end	
	end

end
