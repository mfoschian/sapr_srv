class Activity < ApplicationRecord
	self.inheritance_column = :itype
	
	has_many :missions
end