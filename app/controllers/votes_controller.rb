class VotesController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@votes = @post.votes.create(direction: params[:direction])

		if @votes.valid?
			flash[:notice] = "Voted successfully!"
			redirect_to root_path
		else
			flash[:notice] = "Voting system has some issues...please try after sometime."
			redirect_to root_path
		end
	end

end
