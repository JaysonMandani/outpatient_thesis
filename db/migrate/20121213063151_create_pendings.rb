class CreatePendings < ActiveRecord::Migration
	def change
		create_table :pendings do |t|
			t.string "full_name"
			t.string "patient_status"
			t.string "pending_for"
			t.timestamps
		end	
	end
end
