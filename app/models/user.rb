class User < ActiveRecord::Base
  
  attr_accessible :email, :password, :password_confirmation, :firstname, :lastname
 attr_accessor :password
 
  before_save :encrypt_password 
  before_update :encrypt_password
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
 include ModelMethods
 
 def is_User?
     true
  end
   def is_Super?
     false
  end

def is_Just?
     false
  end
end
