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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160514190837) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attacks", force: :cascade do |t|
    t.integer  "attacker_id"
    t.integer  "user_id"
    t.string   "coor_x"
    t.string   "coor_y"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "attacks", ["user_id"], name: "index_attacks_on_user_id", using: :btree

  create_table "boards", force: :cascade do |t|
    t.integer  "user_id"
    t.json     "positions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "boards", ["user_id"], name: "index_boards_on_user_id", using: :btree

  create_table "ships", force: :cascade do |t|
    t.string   "name"
    t.integer  "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attacks", "users"
  add_foreign_key "boards", "users"
end
