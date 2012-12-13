# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121212081407) do

  create_table "admin_users", :force => true do |t|
    t.string   "first_name",      :limit => 25
    t.string   "last_name",       :limit => 50
    t.string   "email",                         :default => "",    :null => false
    t.string   "address"
    t.integer  "age"
    t.string   "sex"
    t.string   "birthdate"
    t.string   "mobile"
    t.string   "username",        :limit => 25
    t.string   "salt"
    t.string   "hashed_password", :limit => 40
    t.string   "secret_q"
    t.string   "hashed_secret_a", :limit => 40
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.boolean  "admin",                         :default => false
    t.string   "remember_token"
  end

  add_index "admin_users", ["remember_token"], :name => "index_admin_users_on_remember_token"

  create_table "immunizations", :force => true do |t|
    t.integer  "pediatric_id"
    t.string   "vaccination_name"
    t.string   "vaccination_session"
    t.string   "booster_session"
    t.string   "vaccination_type"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "immunizations", ["pediatric_id"], :name => "index_immunizations_on_pediatric_id"

  create_table "inventories", :force => true do |t|
    t.string   "brand_name"
    t.string   "medical_name"
    t.string   "medical_type"
    t.string   "type"
    t.string   "quantity"
    t.string   "price"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "orthodontics", :force => true do |t|
    t.string   "full_name"
    t.string   "address"
    t.string   "occupation"
    t.integer  "mobile_no"
    t.integer  "resident_tel"
    t.integer  "age"
    t.date     "birth_date"
    t.string   "status"
    t.string   "sex"
    t.string   "reffered_by"
    t.string   "birthplace"
    t.date     "examination_date"
    t.text     "examination_result"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "pediatrics", :force => true do |t|
    t.string   "full_name"
    t.string   "address"
    t.integer  "age"
    t.date     "birth_date"
    t.string   "mother_name"
    t.string   "father_name"
    t.integer  "f_age"
    t.integer  "m_age"
    t.integer  "f_occupation"
    t.integer  "m_occupation"
    t.string   "term"
    t.string   "delivery"
    t.string   "birth_weight"
    t.string   "birth_length"
    t.string   "head_circ"
    t.string   "chest_circ"
    t.string   "abdominal"
    t.string   "obsterician"
    t.string   "food"
    t.string   "medicine"
    t.string   "others"
    t.string   "type_of_feeding"
    t.string   "supplementary"
    t.string   "weight"
    t.string   "height"
    t.date     "examination_date"
    t.text     "history_physical_exams"
    t.text     "physicians_instructions"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "contact_no",              :limit => nil
    t.string   "sex",                     :limit => nil
  end

  create_table "pendings", :force => true do |t|
    t.string   "full_name"
    t.string   "patient_status"
    t.string   "pending_for"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "schedules", :force => true do |t|
    t.string   "name"
    t.string   "contact_no"
    t.string   "schedule_for"
    t.date     "scheduled_on"
    t.time     "time"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users_inventories", :id => false, :force => true do |t|
    t.integer "admin_user_id"
    t.integer "inventory_id"
  end

  add_index "users_inventories", ["admin_user_id", "inventory_id"], :name => "index_users_inventories_on_admin_user_id_and_inventory_id"

  create_table "users_orthodontics", :id => false, :force => true do |t|
    t.integer "admin_user_id"
    t.integer "orthopedic_id"
  end

  add_index "users_orthodontics", ["admin_user_id", "orthopedic_id"], :name => "index_users_orthodontics_on_admin_user_id_and_orthopedic_id"

  create_table "users_pediatrics", :id => false, :force => true do |t|
    t.integer "admin_user_id"
    t.integer "pedia_id"
  end

  add_index "users_pediatrics", ["admin_user_id", "pedia_id"], :name => "index_users_pediatrics_on_admin_user_id_and_pedia_id"

  create_table "users_schedules", :id => false, :force => true do |t|
    t.integer "admin_user_id"
    t.integer "schedules_id"
  end

  add_index "users_schedules", ["admin_user_id", "schedules_id"], :name => "index_users_schedules_on_admin_user_id_and_schedules_id"

end
