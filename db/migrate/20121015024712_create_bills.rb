class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer "pedia_id"
	    t.string "vaccination_name"
	    t.string "vaccination_session"
	    t.string "booster_session"
	    t.string "vaccination_type"
      t.timestamps
    end
  end
end
