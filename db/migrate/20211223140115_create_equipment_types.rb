class CreateEquipmentTypes < ActiveRecord::Migration[6.0]
	def self.up
		create_table :equipment_types, id: :string do |t|
			t.json :config
			#{
			#	"slots": [
			# 		{
			# 			"id": "b1",
			# 			"label": "Batteria 1",
			#	 		"accepts": [
			# 				"Battery1",
			# 				"Battery2"
			#	 		],
			# 			"required": true,
			# 			"placeholder": "Scegli la batteria"
			# 		},
			# 		...
			#	]
			#}
		
		end
	end

	def self.down
		drop_table :equipment_types
	end
end
