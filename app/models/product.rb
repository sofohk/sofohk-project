class Product < ActiveRecord::Base
  has_many :posts
  has_attached_file :image,  
    :styles => {:tiny => '30x30>', :thumb => '75x75>', :large => '150x150>' },  
    :default_style => :thumb,  
    :url => "/system/:class/:attachment/:id/:style/:basename.:extension" 
  validates_presence_of :product_name;
end
