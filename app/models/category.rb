class Category < ActiveRecord::Base
	attr_accessible :name, :description
	validates_uniqueness_of :name, :case_sensitive => false
	has_many :posts 
end