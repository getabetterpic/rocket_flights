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

ActiveRecord::Schema.define(version: 20160622150038) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "citext"

  create_table "flight_motors", force: :cascade do |t|
    t.integer  "flight_id"
    t.integer  "motor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "flight_motors", ["flight_id"], name: "index_flight_motors_on_flight_id", using: :btree
  add_index "flight_motors", ["motor_id"], name: "index_flight_motors_on_motor_id", using: :btree

  create_table "flights", force: :cascade do |t|
    t.integer  "rocket_id"
    t.integer  "motor_id"
    t.boolean  "successful"
    t.text     "notes"
    t.datetime "flight_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "altitude"
  end

  add_index "flights", ["motor_id"], name: "index_flights_on_motor_id", using: :btree
  add_index "flights", ["rocket_id"], name: "index_flights_on_rocket_id", using: :btree

  create_table "motors", force: :cascade do |t|
    t.decimal  "diameter_in_mm", null: false
    t.string   "name",           null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "manufacturer"
  end

  add_index "motors", ["name", "manufacturer"], name: "index_motors_on_name_and_manufacturer", unique: true, using: :btree

  create_table "rockets", force: :cascade do |t|
    t.string   "name",               null: false
    t.string   "manufacturer"
    t.decimal  "length"
    t.decimal  "diameter"
    t.decimal  "center_of_pressure"
    t.decimal  "center_of_gravity"
    t.decimal  "drag_coefficient"
    t.integer  "stages"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "rockets", ["name", "manufacturer"], name: "index_rockets_on_name_and_manufacturer", unique: true, using: :btree

  create_table "user_rockets", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "rocket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_rockets", ["rocket_id"], name: "index_user_rockets_on_rocket_id", using: :btree
  add_index "user_rockets", ["user_id"], name: "index_user_rockets_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.citext   "email",         null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "auth0_user_id"
  end

  add_index "users", ["auth0_user_id", "email"], name: "index_users_on_auth0_user_id_and_email", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree

  add_foreign_key "user_rockets", "rockets"
  add_foreign_key "user_rockets", "users"
end
