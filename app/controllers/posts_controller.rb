class PostsController < ApplicationController

	before_filter :create_post_handler, only: [:create, :new]
	
	def index
		@posts = Post.all
		@categories = Category.all
	end	

	def by_category
		@categories = Category.all
		@category = Category.where(:name => params[:type]).first
		@posts = @category.posts.all
	end

	def new
		@post = Post.new
		@category = Category.all
	end

	def show
		@post = Post.where(:id => params[:id]).first
		@comment = Comment.new
	end

	def create
		@post = Post.new(params[:post])
		@post.user = current_user
		if @post.save
			redirect_to root_path, notice: "Posted successfully"
		else
			render "new"
		end	
	end
end	