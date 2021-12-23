class CreateUav < ActiveRecord::Migration[6.0]
	def self.up
		create_table :uav, id: :uuid do |t|
			t.string :nick
			t.string :model
			t.string :producer
			t.string :serial_number
			t.string :mod_max
			t.string :plate
			t.json :authorized_for # { [ "IT-STS-01", "IT-STS-02" ] }
		end

		add_index :uav, :nick
		add_index :uav, :model
		add_index :uav, :serial_number
		add_index :uav, :plate
	end

	def self.down
		drop_table :uav
	end
end
