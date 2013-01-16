class ApplicationController < ActionController::Base

	helper_method :current_user, :logged_in?, :create_post_handler, :create_comments_handler
	protect_from_forgery

	def current_user
		if !session[:user_id].nil?
			User.find(session[:user_id])
		end
	end

	def logged_in?
		!!session[:user_id]
	end

	def create_post_handler
		if !logged_in?
			session[:create_post_clicked] = true
			redirect_to login_path
		end
	end

	def vote_handler
		if !logged_in?
			redirect_to root_path, notice: "You need to <a href='/login'>login</a> or <a href='/register'>register</a> to be able to vote".html_safe
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

end
