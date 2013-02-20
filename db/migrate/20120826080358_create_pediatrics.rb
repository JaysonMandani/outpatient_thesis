class CreatePediatrics < ActiveRecord::Migration
  def change
    create_table :pediatrics do |t|
      t.string "full_name"
      t.string "address"
      t.integer "contact_no"
      t.integer "age"
      t.date "birth_date"
      t.string "sex"
      t.string "mother_name"
      t.string "father_name"
      t.integer "f_age"
      t.integer "m_age"
      t.integer "f_occupation"
      t.integer "m_occupation"
      t.string "term"
      t.string "delivery"
      t.string "birth_weight"
      t.string "birth_length"
      t.string "head_circ"
      t.string "chest_circ"
      t.string "abdominal"
      t.string "obsterician"
      t.string "food"
      t.string "medicine"
      t.string "others"
      t.string "type_of_feeding"
      t.string "supplementary"
      t.timestamps
    end
  end
end
