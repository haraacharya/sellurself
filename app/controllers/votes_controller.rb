class VotesController < ApplicationController

	before_filter :vote_handler, only: [:create]

	def create
		@post = Post.where(:id => params[:post_id]).first
		@vote = @post.votes.new(direction: params[:direction])
		@vote.user = current_user
		if @vote.save
			redirect_to root_path, notice: "Voted successfully!"
		end
	end

end
