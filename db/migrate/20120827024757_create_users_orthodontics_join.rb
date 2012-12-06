class CreateUsersOrthodonticsJoin < ActiveRecord::Migration
  
  def up
    create_table :users_orthodontics, :id => false do |t|
      t.integer "admin_user_id"
      t.integer "orthodontic_id"
    end
    add_index :users_orthodontics, ["admin_user_id", "orthodontic_id"]
  end

  def down
    drop_table :users_orthodontics
  end
  
end
