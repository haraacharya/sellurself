class SearchController < ApplicationController
	
	def index
		@categories = Category.all
		if params[:search].length > 0
			@results = Search.find_by_search_string(params[:search])
			
			if @results.count <= 0
				flash[:notice] = "No posts found for search text: " + params[:search] + ". Try Again."
				render "search/index"
			else	
				render "search/index" 		 
			end
		else
			flash[:error] = "Search text field can't be blank"
			redirect_to root_path
		end		
	end

end