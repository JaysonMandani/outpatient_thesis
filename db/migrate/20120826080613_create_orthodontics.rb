class CreateOrthodontics < ActiveRecord::Migration
  def change
    create_table :orthodontics do |t|
      t.string "full_name"
      t.string "address"
      t.string "occupation"
      t.string "mobile_no"
      t.string "resident_no"
      t.integer "age"
      t.date "birth_date"
      t.string "status"
      t.string "sex"
      t.string "reffered_by"
      t.string "birthplace"
      t.date "examination_date"
      t.text "examination_result"
      t.timestamps
    end
  end
end
