class RemoveUsageFromEquipment < ActiveRecord::Migration[6.0]
	def self.up
		remove_column :equipments, :used
	end

	def self.down
		add_column :equipments, :used, :boolean, :default => false
		add_index :equipments, :used
	end
end
