class VotesController < ApplicationController

	before_filter :vote_handler, only: [:create]

	def create
		if Vote.where(post_id: params[:post_id], user_id: current_user.id, direction: params[:direction]).last == nil 
			@post = Post.where(:id => params[:post_id]).first
			@vote = @post.votes.new(direction: params[:direction])
			@vote.user = current_user
			if @vote.save
				redirect_to root_path, notice: "Voted successfully!"
			end
		else
			redirect_to root_path, notice: "Duplicate vote found!"
		end	
	end

end
