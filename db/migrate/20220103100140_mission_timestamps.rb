class MissionTimestamps < ActiveRecord::Migration[6.0]
	def self.up
		change_column :missions, :dt_start, :datetime
		change_column :missions, :dt_end, :datetime
		change_column :activities, :dt, :datetime
	  end
	
	  def self.down
		change_column :missions, :dt_start, :date
		change_column :missions, :dt_end, :date
		change_column :activities, :dt, :date
	  end
end
