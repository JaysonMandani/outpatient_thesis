class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string "name"
      t.string "schedule_for"
      t.string "contact_no"
      t.date "date"
      t.time "time"
      t.timestamps
    end
  end
end
