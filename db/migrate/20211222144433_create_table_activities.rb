class CreateTableActivities < ActiveRecord::Migration[6.0]
	def self.up

		create_table :activities, id: :uuid do |t|
			t.string :title
			t.date :dt
			t.string :municipality_code
			t.string :locality
			t.float :alt
			t.float :lat
			t.float :lon
			t.float :flight_max_height
			t.integer :category
			t.integer :scenary
			t.integer :flight_type
			t.integer :type
			t.timestamps
		end

		# execute "ALTER TABLE activities ADD PRIMARY KEY (id);"

		add_index :activities, :dt

	end

	def self.down
		drop_table :activities
	end
end
