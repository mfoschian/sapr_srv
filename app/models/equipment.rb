class Equipment < ApplicationRecord
	belongs_to :mission, optional: true
	has_many :usages

	self.inheritance_column = :itype

	self.table_name = "equipments"
end