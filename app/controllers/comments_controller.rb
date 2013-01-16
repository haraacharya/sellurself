class CommentsController < ApplicationController
	
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(params[:comment])
		@comment.user = current_user

		if @comment.save
			redirect_to post_path(@post), notice: "Comment posted successfully"
		else
			render "posts/show"
		end	
	
	end

end