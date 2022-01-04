class Mission < ApplicationRecord
	belongs_to :activity
	belongs_to :pilot
end