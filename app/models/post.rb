class Post < ActiveRecord::Base
	attr_accessible :title, :price, :description, :url

	validates :title, :price, :description, presence: true

	has_many :comments
	has_many :votes
end