class SearchController < ApplicationController
	
	def index
		@results = Search.find_by_search_string(params[:search])
		
		if @results.count <= 0
			flash[:notice] = "No posts found for search text: " + params[:search] + ". Try Again."
			render "search/index"
		else	
			render "search/index" 		 
		end	
	end

end