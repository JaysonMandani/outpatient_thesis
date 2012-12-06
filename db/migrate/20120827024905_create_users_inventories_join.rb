class CreateUsersInventoriesJoin < ActiveRecord::Migration
  
  def up
    create_table :users_inventories, :id => false do |t|
      t.integer "admin_user_id"
      t.integer "inventory_id"
    end
    add_index :users_inventories, ["admin_user_id", "inventory_id"]
  end

  def down
    drop_table :users_inventories
  end
  
end
