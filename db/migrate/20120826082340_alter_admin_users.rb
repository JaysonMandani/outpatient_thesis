class AlterAdminUsers < ActiveRecord::Migration
  # def up
  #   #rename_table("users", "admin_users")
  #   add_column("admin_users", "username", :string, :limit => 25)
  #   change_column("admin_users", "email", :string, :limit => 10)
  #   rename_column("admin_users", "password", "hashed_password")
  #   add_column("admin_users", "salt", :string, :limit => 40)
  #   add_column("admin_users", "secret_q", :string, :limit => 50)
  #   add_column("admin_users", "secret_a", :string, :limit => 50)
  #   puts "*** About to add an index ***"
  #   add_index("admin_users", "username")
  # end
  
  # def down
  #   #remove_index("admin_users", "username")
  #   remove_column("admin_users", "salt")
  #   remove_column("admin_users", "secret_q")
  #   remove_column("admin_users", "secret_a")
  #   rename_column("admin_users", "hashed_password", "password")
  #   change_column("admin_users", "email", :string, :default => "", :null => false)
  #   remove_column("admin_users", "username")
  #   #rename_table("admin_users", "users")
  # end
end
