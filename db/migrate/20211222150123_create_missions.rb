class CreateMissions < ActiveRecord::Migration[6.0]
	def self.up
		create_table :missions, id: :uuid do |t|
			t.uuid :activity_id
			t.date :dt_start
			t.date :dt_end
			t.json :uav_setup # { "equip_id": "{1111}", "children": { "b1": { "equip_id": "{BBBB.1112}", "children": [] }, ... }
			t.json :meteo_info # { "clouds_coverage": 1, "clouds_height": 1, "visibility": 1, "precipitation": 1, "wind_intensity": 0, "temperature": 25, "humidity": 90, "pression": 5 },
			t.json :sat_info # { "sat_rc": 5, "sat": 4 }
		end

		add_index :missions, :activity_id
		add_index :missions, :dt_start
		add_index :missions, :dt_end
	end

	def self.down
		drop_table :missions
	end
end
