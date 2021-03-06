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

ActiveRecord::Schema.define(version: 20161103192114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "households", force: :cascade do |t|
    t.string   "name"
    t.integer  "num_people"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.datetime "exp_date"
    t.datetime "date_purchased"
    t.text     "description"
    t.string   "where_to_buy"
    t.string   "rating"
    t.integer  "upc"
    t.boolean  "in_use"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "household_id"
    t.index ["household_id"], name: "index_items_on_household_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "household_id"
    t.string   "password_digest"
    t.index ["household_id"], name: "index_users_on_household_id", using: :btree
  end

  add_foreign_key "items", "households"
  add_foreign_key "users", "households"
end
