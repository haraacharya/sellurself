module PostsHelper

	def display_my_work(post)
		if post.url.starts_with?("http://")
			return link_to post.url, post.url
		elsif post.url.to_s == ''
			return "<strong>Not Updated!</strong>".html_safe
		else
			return link_to post.url, "http://" + post.url
		end
				
	end	

	def display_show_title(post)
		if post.url.starts_with?("http://")
			return link_to post.title, post.url
		elsif post.url.to_s == ''
			return post.title
		else
			return link_to post.title, "http://" + post.url
		end
				
	end


	def display_post_comments(post)
		if post.comments.count <= 0
			return "Be the first to comment!"
		else
			str = ""
			post.comments.reload.order("created_at DESC").each do |comment|
				str << "<li>" + comment.content + "</li>"
			end 
			return str.html_safe
		end
	end

end	