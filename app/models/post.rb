class Post < ActiveRecord::Base
	attr_accessible :title, :price, :description, :url, :user_id

	validates :title, :price, :description, presence: true

	has_many :comments
	has_many :votes
	belongs_to :user
end