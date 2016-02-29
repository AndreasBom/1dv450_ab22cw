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

ActiveRecord::Schema.define(version: 20160228183823) do

  create_table "apis", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "key",         null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "application"
  end

  create_table "creators", force: :cascade do |t|
    t.string   "creatorname"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "events", force: :cascade do |t|
    t.text     "message"
    t.integer  "rating"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.integer  "position_id"
    t.integer  "creator_id"
  end

  add_index "events", ["creator_id"], name: "index_events_on_creator_id"
  add_index "events", ["position_id"], name: "index_events_on_position_id"

  create_table "events_tags", id: false, force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "tag_id",   null: false
  end

  add_index "events_tags", ["event_id", "tag_id"], name: "index_events_tags_on_event_id_and_tag_id"
  add_index "events_tags", ["tag_id", "event_id"], name: "index_events_tags_on_tag_id_and_event_id"

  create_table "positions", force: :cascade do |t|
    t.float    "longitude"
    t.float    "latitude"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "address"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "role",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id", "user_id"], name: "index_roles_users_on_role_id_and_user_id"

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 50, null: false
    t.string   "last_name",       limit: 50, null: false
    t.string   "email",                      null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "password_digest"
  end

end
