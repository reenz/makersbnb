require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :username, String, required: true, unique: true
  property :email, String, format: :email_address, required: true, unique: true
  property :password_hash, Text, required: true

  def password=(password)
    self.password_hash = BCrypt::Password.create(password)
  end

end
