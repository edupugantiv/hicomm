class Post < ActiveRecord::Base

  attr_accessor :phone_number	

  #relations
  belongs_to :user
  belongs_to :postable, polymorphic: true
  
  has_many :posts, as: :postable

  acts_as_votable 

end
