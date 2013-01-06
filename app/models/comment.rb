class Comment < ActiveRecord::Base
	attr_accessible :post_id, :content

	validates :content, presence: true
end