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

ActiveRecord::Schema.define(version: 20141105204736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "posts", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.hstore   "properties"
    t.string   "source"
    t.boolean  "hide"
  end

  create_table "travels", id: false, force: true do |t|
    t.integer "post_id", null: false
    t.integer "trip_id", null: false
  end

  add_index "travels", ["post_id", "trip_id"], name: "index_travels_on_post_id_and_trip_id", using: :btree
  add_index "travels", ["trip_id", "post_id"], name: "index_travels_on_trip_id_and_post_id", using: :btree

  create_table "trips", force: true do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.integer  "uid"
    t.string   "provider"
  end

end
