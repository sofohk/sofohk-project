class Usermessage < ActiveRecord::Base
  belongs_to :to_user, :class_name => "User", :foreign_key => "to_user_id"
  belongs_to :from_user, :class_name => "User", :foreign_key => "from_user_id"
  
  validates_presence_of :title, :message
  
  def to_user_name
    @to_user_name
  end
  
  def to_user_name=(name)
    return true
  end
end
