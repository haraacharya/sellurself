class Comment < ActiveRecord::Base
	attr_accessible :content, :user_id

	validates :content, presence: true
	belongs_to :user
	belongs_to :post
end