class CreateAdminUsersInventoriesJoin < ActiveRecord::Migration
  
  def up
    create_table :admin_users_inventories, :id => false do |t|
      t.integer "admin_user_id"
      t.integer "inventory_id"
    end
    add_index :admin_users_inventories, ["admin_user_id", "inventory_id"]
  end

  def down
    drop_table :admin_users_inventory
  end
  
end
