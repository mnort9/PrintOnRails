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

ActiveRecord::Schema.define(:version => 20130520152540) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "addresses", :force => true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "customer_id"
    t.string   "zip"
    t.string   "address_name"
  end

  add_index "addresses", ["customer_id"], :name => "index_addresses_on_customer_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "phone"
    t.string   "role"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "company"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "quantity"
    t.string   "style"
    t.string   "color"
    t.integer  "s"
    t.integer  "m"
    t.integer  "l"
    t.integer  "xl"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "order_id"
    t.integer  "yxs"
    t.integer  "ys"
    t.integer  "ym"
    t.integer  "yl"
    t.integer  "yxl"
    t.integer  "xs"
    t.integer  "xxl"
    t.integer  "xxxl"
    t.integer  "xxxxl"
  end

  create_table "only_admins", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "only_admins_authorizations", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "order_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "order_priorities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "weight"
  end

  add_index "order_priorities", ["weight"], :name => "index_order_priorities_on_weight"

  create_table "order_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "order_types", :force => true do |t|
    t.string   "name"
    t.boolean  "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "name"
    t.text     "whiteboard"
    t.string   "color_front"
    t.string   "color_back"
    t.string   "color_sleeve"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "customer_id"
    t.integer  "order_category_id"
    t.integer  "order_type_id"
    t.integer  "order_status_id"
    t.integer  "order_priority_id"
    t.integer  "print_location_id"
    t.string   "artwork"
    t.string   "proof"
    t.integer  "number"
    t.integer  "assignee_id"
  end

  add_index "orders", ["assignee_id"], :name => "index_orders_on_assignee_id"
  add_index "orders", ["customer_id"], :name => "index_orders_on_customer_id"
  add_index "orders", ["number"], :name => "index_orders_on_number"
  add_index "orders", ["order_category_id"], :name => "index_orders_on_order_category_id"
  add_index "orders", ["order_priority_id"], :name => "index_orders_on_order_priority_id"
  add_index "orders", ["print_location_id"], :name => "index_orders_on_print_location_id"

  create_table "print_locations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
