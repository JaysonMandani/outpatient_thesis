class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string "brand_name"
      t.string "medical_name"
      t.string "type"
      t.string "quantity"
      t.string "price"
      t.timestamps
    end
  end
end
