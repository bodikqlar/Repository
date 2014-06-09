module ModelMethods
  def self.included(person)
    person.extend(ClassMethods)
  end

  def encrypt_password
    
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    
  end

module ClassMethods
  def authenticate(email, password)
    person = find_by_email(email)
      if person && person.password_hash == BCrypt::Engine.hash_secret(password, person.password_salt)
        person
      else
        nil
      end
  end

def search(search)
  if search
    where('email LIKE ?', "%#{search}%")
  else
    scoped
  end
end


end 
end