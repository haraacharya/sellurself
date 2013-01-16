module PostsHelper
	
	def display_my_work(post)
		if post.url.starts_with?("http://")
			link_to post.url, post.url
		elsif post.url.to_s == ''
			"<strong>Not Updated!</strong>".html_safe
		else
			link_to post.url, "http://" + post.url
		end
				
	end	

	def display_show_title(post)
		if post.url.starts_with?("http://")
			link_to post.title, post.url
		elsif post.url.to_s == ''
			post.title
		else
			link_to post.title, "http://" + post.url
		end
				
	end


	def display_post_comments(post)
		if post.comments.count <= 0
			return "Be the first to comment!"
		else
			str = ""
			post.comments.reload.order("created_at DESC").each do |comment|
				str << '<li class="comments">' + comment.content + "<br/>By: " + User.find(comment.user_id).firstname.to_s + "</li><br/>"
			end 
			str.html_safe
		end
	end

	def last_comment_time(post)
	
		if post.comments.count > 0
			inhrs = ((Time.now - post.comments.order("created_at DESC").first.created_at)/3600).round
			if inhrs < 24
				"Last comment: " + pluralize(inhrs.to_s, "hr") + " ago..." 
			else
				"Last comment: " + pluralize((inhrs / 24).to_s ,"day") + " ago..." 
			end	
		else
			link_to "Be the first to comment!", post_path(post)	
		end	
	
	end


	def find_user_details(post)
		User.find(post.user_id)
	end	


end	