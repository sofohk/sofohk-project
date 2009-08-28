# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090826170511) do

  create_table "posts", :force => true do |t|
    t.integer   "product_id",                 :null => false
    t.string    "short_title", :limit => 100, :null => false
    t.text      "content",                    :null => false
    t.integer   "good_count",                 :null => false
    t.integer   "user_id",                    :null => false
    t.timestamp "created_at",                 :null => false
    t.timestamp "updated_at",                 :null => false
  end

  add_index "posts", ["product_id"], :name => "product_id"
  add_index "posts", ["short_title"], :name => "short_title"
  add_index "posts", ["user_id"], :name => "user_id"

  create_table "products", :force => true do |t|
    t.string   "product_name",                      :null => false
    t.text     "description"
    t.string   "tags",               :limit => 500
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "usermessages", :force => true do |t|
    t.integer   "to_user_id",                 :null => false
    t.integer   "from_user_id",               :null => false
    t.string    "title",        :limit => 50, :null => false
    t.text      "message",                    :null => false
    t.timestamp "created_at",                 :null => false
    t.timestamp "updated_at",                 :null => false
  end

  add_index "usermessages", ["from_user_id"], :name => "from_user_id"
  add_index "usermessages", ["to_user_id"], :name => "to_user_id"

  create_table "users", :force => true do |t|
    t.string   "loginname",          :limit => 20,  :null => false
    t.string   "nickname",           :limit => 40,  :null => false
    t.string   "first_name",         :limit => 20
    t.string   "last_name",          :limit => 20
    t.string   "email",              :limit => 50
    t.integer  "mobile"
    t.text     "nickname_history"
    t.string   "hashed_password",    :limit => 100, :null => false
    t.string   "salt",               :limit => 100, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

end
