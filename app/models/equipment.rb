class Equipment < ApplicationRecord
	self.inheritance_column = :itype

	self.table_name = "equipments"

end