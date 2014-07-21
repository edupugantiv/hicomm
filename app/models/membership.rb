class Membership < ActiveRecord::Base

	#relations
	belongs_to :group
	belongs_to :user

end
