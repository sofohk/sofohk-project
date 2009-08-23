require 'digest/sha1'

class User < ActiveRecord::Base
  has_many :posts
  has_many :usermessages
  has_attached_file :image,  
    :styles => {:tiny => '30x30>', :thumb => '75x75>', :large => '150x150>' },  
    :default_style => :thumb,  
    :url => "/system/:class/:attachment/:id/:style/:basename.:extension" 
  validates_presence_of :loginname, :nickname, :email
  validates_uniqueness_of :loginname, :nickname
  attr_accessor :password_confirmation
  validates_confirmation_of :password
  validate :password_non_blank
  
  def self.authenticate(loginname, password)
    user = self.find_by_loginname(loginname)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end
  
  def self.current_password
    @current_password
  end
  
  def current_password
    @current_password
  end
  
  def current_password=(pwd)
    return if User.authenticate(self.name, pwd)
  end
  
  # 'password' is a virtual attribute
  def password
    @password
  end
  
  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end
  
private
  
  def password_non_blank
    errors.add_to_base("Missing password" ) if hashed_password.blank?
  end
  
  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
  
  def self.encrypted_password(password, salt)
    string_to_hash = password + "wibble" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end
end