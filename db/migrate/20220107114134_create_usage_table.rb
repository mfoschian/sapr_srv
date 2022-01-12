class CreateUsageTable < ActiveRecord::Migration[6.0]
	def self.up
		create_table :usages do |t|

			t.uuid :mission_id
			t.uuid :equipment_id
			t.datetime :dt_start
			t.datetime :dt_end
			t.integer :seconds

			t.index :mission_id
			t.index :equipment_id
			t.index :dt_start
			t.index :dt_end
			t.index :seconds
		end

	end

	def self.down
		drop_table :usages
	end 
end
