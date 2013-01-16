class User < ActiveRecord::Base
  attr_accessible :password, :username, :firstname, :lastname
  has_secure_password
  validates :username, :firstname, :lastname, :presence => true

  validates_uniqueness_of :username

  has_many :posts
  has_many :comments
  has_many :votes
end
