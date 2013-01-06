class CommentsController < ApplicationController
	
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment])

		if @comment.valid?
			flash[:notice] = "Comment posted successfully"
			redirect_to post_path(@post)
		else
			render "posts/show"
		end	
	
	end

end