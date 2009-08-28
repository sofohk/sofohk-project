class Post < ActiveRecord::Base
  acts_as_taggable
  belongs_to :user
  belongs_to :product
end
