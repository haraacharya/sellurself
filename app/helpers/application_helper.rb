module ApplicationHelper

	def active(page)
  		return 'class="active"'.html_safe if current_page?(page)
  	end

	def display_category
		@categories = Category.all
		str = ""
		@categories.each do |category|
			str << '<li>' + category.name + "</li>"
		end 
		str.html_safe
	end	

end
