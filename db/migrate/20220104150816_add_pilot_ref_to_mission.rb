class AddPilotRefToMission < ActiveRecord::Migration[6.0]
	def self.up
		add_reference :missions, :pilot, type: :uuid
		# add_index :missions, :pilot_id
	end

	def self.down
		# remove_index :missions, :pilot_id
		remove_reference :missions, :pilot
	end
end
