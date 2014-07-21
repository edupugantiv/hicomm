class Group < ActiveRecord::Base

  #relations
  has_many :memberships
  has_many :user, through: :memberships

  has_many posts, as: :postable

  has_many :collaborations
  has_many :collaborators, through: :collaborations

  has_many :inverse_collaborations, :class_name =>  "Collaboration", :foreign_key => "collaborator_id"
  has_many :inverse_collaborators, :through => :inverse_collaborations, :source => :group

  acts_as_votable 
  
end
