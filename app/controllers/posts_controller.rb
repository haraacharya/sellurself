class PostsController < ApplicationController

	before_filter :create_post_handler, only: [:create, :new]
	
	def index
		@posts = Post.all
	end	

	def new
		@post = Post.new
	end

	def show
		@post = Post.where(:id => params[:id]).first
		@comment = Comment.new
	end

	def create
		@post = Post.create(params[:post])

		if @post.valid?
			flash[:notice] = "Posted successfully"
			redirect_to root_path
		else
			render action: "new"
		end	

	end
end	