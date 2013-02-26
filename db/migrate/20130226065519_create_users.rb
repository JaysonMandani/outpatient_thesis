class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string "first_name", :limit => 25
      t.string "last_name", :limit => 50
      t.string "email", :default => "", :null => false
      t.string "hashed_password", :limit => 40
      t.string "username", :limit => 20
      t.string "salt", :limit => 40
      t.string "hashed_secret_a", :limit => 40
      t.string "secret_q"
      t.boolean "admin", :default => false 
      t.string "remember_token"
      t.string "mobile"
      t.date   "birthdate"
      t.string "sex"
      t.string "address"
      t.integer "age"
      t.timestamps
    end
  end
end
