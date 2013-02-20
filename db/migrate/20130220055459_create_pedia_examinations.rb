class CreatePediaExaminations < ActiveRecord::Migration
  def change
    create_table :pedia_examinations do |t|
      t.references :pediatric
      t.string "weight"
      t.string "height"
      t.date "examination_date"
      t.text "history_physical_exams"
      t.text "physicians_instructions"
      t.timestamps
    end
    add_index("pedia_examinations", "pediatric_id")
  end
end
