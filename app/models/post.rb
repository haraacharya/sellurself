class Post < ActiveRecord::Base
	attr_accessible :title, :price, :description, :url, :category_id

	validates :title, :price, :description, presence: true

	has_many :comments
	has_many :votes
	belongs_to :user
	belongs_to :category

	def vote_number
		votes.where(:direction => "up").count - votes.where(direction: "down").count
	end

end