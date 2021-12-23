class AddTablePilots < ActiveRecord::Migration[6.0]
	def self.up
		create_table :pilots, id: :uuid do |t|
			t.string :name
			t.string :user_code
			t.string :operator_code
			t.string :EASA_code

			t.timestamps
		end

		add_index :pilots, :user_code
		add_index :pilots, :name
		add_index :pilots, :operator_code
	end

	def self.down
		drop_table :pilots
	end
end
