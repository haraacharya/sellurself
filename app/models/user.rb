class User < ActiveRecord::Base
  attr_accessible :password_digest, :password, :username, :firstname, :lastname
  has_secure_password
  validates :username, :firstname, :lastname, :presence => true

  has_many :posts
end
