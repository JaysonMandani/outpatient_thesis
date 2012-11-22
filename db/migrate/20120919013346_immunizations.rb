class Immunizations < ActiveRecord::Migration
  def up
  	create_table :Immunizations do |t|
  		t.integer "pedia_id"
  		t.string "vaccination_name"
  		t.string "vaccination_session"
  		t.string "booster_session"
  		t.string "vaccination_type"
  		t.timestamps
  	end
  end
  
  def down
  end
end
