class Collaboration < ActiveRecord::Base

  #relations
  belongs_to :group
  belongs_to :collaborator, :class_name => 'Group'

end
