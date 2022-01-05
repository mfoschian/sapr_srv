class AddCloseDateToActivity < ActiveRecord::Migration[6.0]
	def self.up
		add_column :activities, :dt_closed, :datetime
		add_index :activities, :dt_closed
	end

	def self.down
		remove_column :activities, :dt_closed
	end 
end
