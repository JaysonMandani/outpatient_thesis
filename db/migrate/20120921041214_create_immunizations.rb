class CreateImmunizations < ActiveRecord::Migration
  def change
    create_table :immunizations do |t|
    	#t.integer "pediatric_id"
      t.references :pediatric
  		t.string "vaccination_name"
  		t.string "vaccination_session"
  		t.string "booster_session"
  		t.string "vaccination_type"
     t.timestamps
    end
    add_index("immunizations", "pediatric_id")
  end
end
