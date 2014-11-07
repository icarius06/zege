class CreateSecurityLevels < ActiveRecord::Migration
	 def change
	    create_table :security_levels do |t|
		  t.column :level, :string
		  
	      t.timestamps
	    end
	  end
end