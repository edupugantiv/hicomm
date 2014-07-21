class Group < ActiveRecord::Base

  #relations
  has_many :memberships
  has_many :user, through: :memberships

  acts_as_votable 
end
