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

	def display_post_comments(post)
		if post.comments.count <= 0
			return "Be the first to comment!"
		else
			return display_comments(post)
		end
	end

	def display_comments(post)
		post.comments.reload.each do |comment|
			puts comment.content 
		end 
	end

end	