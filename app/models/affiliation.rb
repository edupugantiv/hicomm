class Affiliation < ActiveRecord::Base

  #relations
  belongs_to :user
  belongs_to :affiliate, :class_name => 'User'

end
