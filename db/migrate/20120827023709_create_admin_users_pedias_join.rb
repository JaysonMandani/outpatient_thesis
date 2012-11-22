class CreateAdminUsersPediasJoin < ActiveRecord::Migration
  
  def up
    create_table :admin_users_pedias, :id => false do |t|
      t.integer "admin_user_id"
      t.integer "pedia_id"
    end
    add_index :admin_users_pedias, ["admin_user_id", "pedia_id"]
  end

  def down
    drop_table :admin_users_pedias
  end
  
end
