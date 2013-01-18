class CategoriesController < ApplicationController
	
	before_filter :require_login

	def index
		@category = Category.new
		@categories = Category.all
	end	

	def new
	end

	def create
		@categories = Category.all
		@category = Category.new(params[:category])

		if @category.save
			redirect_to categories_path, notice: "Category created successfully." 
		else
			render "categories/index", error: "Category couldn't be created." 
		end
	end
end