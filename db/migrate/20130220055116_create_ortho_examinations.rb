class CreateOrthoExaminations < ActiveRecord::Migration
  def change
    create_table :ortho_examinations do |t|
      t.references :orthodontic
      t.date "examination_date"
      t.text "examination_result"
      t.timestamps
    end
    add_index("ortho_examinations", "orthodontic_id")
  end
end
