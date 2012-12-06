class CreateUsersSchedulesJoin < ActiveRecord::Migration
  
  def up
    create_table :users_schedules, :id => false do |t|
      t.integer "admin_user_id"
      t.integer "schedule_id"
    end
    add_index :users_schedules, ["admin_user_id", "schedule_id"]
  end

  def down
    drop_table :users_schedules
  end
  
end
