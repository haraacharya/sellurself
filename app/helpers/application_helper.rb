module ApplicationHelper

	def display_category
		@categories = Category.all
		str = ""
		@categories.each do |category|
			str << '<li>' + category.name + "</li>"
		end 
		str.html_safe
	end	

end
