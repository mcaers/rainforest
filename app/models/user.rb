class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation 
  
  has_secure_password

  validates_presence_of :password, :on => :create
  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true

  has_many :reviews

end
