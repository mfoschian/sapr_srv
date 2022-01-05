class AddMissionToEquipment < ActiveRecord::Migration[6.0]
	def self.up
		add_reference :equipments, :mission, type: :uuid
		# add_index :missions, :pilot_id
	end

	def self.down
		# remove_index :missions, :pilot_id
		remove_reference :equipments, :mission
	end
end
