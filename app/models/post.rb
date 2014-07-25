class Post < ActiveRecord::Base

  attr_accessor :phone_number	

  #relations
  belongs_to :user
  belongs_to :postable, polymorphic: true
  
  has_many :posts
  belongs_to :post

  acts_as_votable 

  def is_conversation
  	!self.post.nil? 
  end

end
