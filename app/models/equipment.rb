class Equipment < ApplicationRecord
	belongs_to :mission, optional: true

	self.inheritance_column = :itype

	self.table_name = "equipments"
end