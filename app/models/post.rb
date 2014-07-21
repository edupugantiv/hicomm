class Post < ActiveRecord::Base

  #relations
  belongs_to :user
  belongs_to :postable, polymorphic: true
  
  acts_as_votable 

end
