class CreateEquipments < ActiveRecord::Migration[6.0]
	def self.up
		create_table :equipments, id: :uuid do |t|
			t.string :name
			t.string :type
			t.boolean :used
		end

		add_index :equipments, :name
		add_index :equipments, :type
		add_index :equipments, :used
	end

	def self.down
		drop_table :equipments
	end 
end
