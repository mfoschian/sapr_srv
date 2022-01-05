class Mission < ApplicationRecord
	belongs_to :activity
	belongs_to :pilot, optional: true
	has_many :equipments
end