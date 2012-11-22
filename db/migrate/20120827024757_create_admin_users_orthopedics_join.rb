class CreateAdminUsersOrthopedicsJoin < ActiveRecord::Migration
  
  def up
    create_table :admin_users_orthopedics, :id => false do |t|
      t.integer "admin_user_id"
      t.integer "orthopedic_id"
    end
    add_index :admin_users_orthopedics, ["admin_user_id", "orthopedic_id"]
  end

  def down
    drop_table :admin_users_orthos
  end
  
end
