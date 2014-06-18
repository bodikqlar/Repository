class Admin < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :firstname, :lastname, :checkbox, :type
  attr_accessor :password, :checkbox
  before_save :encrypt_password 
  before_update :encrypt_password
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
   include ModelMethods

  def is_Super?
    if type=="SuperAdmin"
    	true
    else 
    	false
    end
  end

    def is_Just?
    if type=="JustAdmin"
      true
    else 
      false
    end
  end
  
 def is_User?
     false
  end
  
  def self.search(search)
  if search
    where('email LIKE ?', "%#{search}%")
  else
    scoped
  end
end

end
