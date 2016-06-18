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

ActiveRecord::Schema.define(version: 20160618084407) do

  create_table "flight_motors", force: :cascade do |t|
    t.integer  "flight_id"
    t.integer  "motor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "flight_motors", ["flight_id"], name: "index_flight_motors_on_flight_id"
  add_index "flight_motors", ["motor_id"], name: "index_flight_motors_on_motor_id"

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

  add_index "flights", ["motor_id"], name: "index_flights_on_motor_id"
  add_index "flights", ["rocket_id"], name: "index_flights_on_rocket_id"

  create_table "motors", force: :cascade do |t|
    t.decimal  "diameter_in_mm", null: false
    t.string   "name",           null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "manufacturer"
  end

  add_index "motors", ["name", "manufacturer"], name: "index_motors_on_name_and_manufacturer", unique: true

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

end
