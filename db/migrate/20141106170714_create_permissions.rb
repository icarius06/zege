class CreatePermissions < ActiveRecord::Migration
	def change
	    create_table :permissions do |t|
		  t.column :level_id, :integer
		  t.column :user_id, :integer
	      t.timestamps
	    end
	end
end