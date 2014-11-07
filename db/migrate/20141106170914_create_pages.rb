class CreatePages < ActiveRecord::Migration
	def change
	    create_table :pages do |t|
		  t.column :controller_name, :string
		  t.column :action_name, :string
		  t.column :security_level_id, :integer
		  t.timestamps
	    end
	end
end