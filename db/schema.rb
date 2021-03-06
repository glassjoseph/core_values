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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170729201720) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dailies", force: :cascade do |t|
    t.string   "goal"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_dailies_on_user_id", using: :btree
  end

  create_table "journals", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "daily_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["daily_id"], name: "index_journals_on_daily_id", using: :btree
    t.index ["user_id"], name: "index_journals_on_user_id", using: :btree
  end

  create_table "resources", force: :cascade do |t|
    t.string   "resource_type", default: ""
    t.text     "content",       default: ""
    t.text     "notes",         default: ""
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["user_id"], name: "index_resources_on_user_id", using: :btree
  end

  create_table "scores", force: :cascade do |t|
    t.integer  "score"
    t.date     "date"
    t.integer  "daily_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["daily_id"], name: "index_scores_on_daily_id", using: :btree
  end

  create_table "supporters", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.integer "user_id"
    t.integer "daily_id"
    t.index ["daily_id"], name: "index_supporters_on_daily_id", using: :btree
    t.index ["user_id"], name: "index_supporters_on_user_id", using: :btree
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
  end

  add_foreign_key "dailies", "users"
  add_foreign_key "journals", "dailies"
  add_foreign_key "journals", "users"
  add_foreign_key "resources", "users"
  add_foreign_key "scores", "dailies"
  add_foreign_key "supporters", "dailies"
  add_foreign_key "supporters", "users"
end
