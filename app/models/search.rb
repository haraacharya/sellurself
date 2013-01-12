#search.rb
#This is not an active record class, but will use the Post class
class Search

	def self.find_by_search_string(searchstring)
		@results = Post.where("title LIKE ? or description LIKE ?", "%#{searchstring}%", "%#{searchstring}%")
	end

end