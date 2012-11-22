class CreateAdminUsersSchedulesJoin < ActiveRecord::Migration
  
  def up
    create_table :admin_users_schedules, :id => false do |t|
      t.integer "admin_user_id"
      t.integer "schedules_id"
    end
    add_index :admin_users_schedules, ["admin_user_id", "schedules_id"]
  end

  def down
    drop_table :admin_users_schedules
  end
  
end
