class Post < ActiveRecord::Base

  #relations
  belongs_to :user

  acts_as_votable 

end
