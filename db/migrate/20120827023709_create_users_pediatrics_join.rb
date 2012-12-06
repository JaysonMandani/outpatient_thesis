class CreateUsersPediatricsJoin < ActiveRecord::Migration
  
  def up
    create_table :users_pediatrics, :id => false do |t|
      t.integer "admin_user_id"
      t.integer "pedia_id"
    end
    add_index :users_pediatrics, ["admin_user_id", "pedia_id"]
  end

  def down
    drop_table :users_pediatrics
  end
  
end
