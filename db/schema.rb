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

ActiveRecord::Schema.define(version: 20150524000408) do

  create_table "event_pictures", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "name"
    t.integer  "max_attendance"
    t.datetime "start_time"
    t.datetime "create_time"
    t.text     "description"
    t.integer  "manager_id"
  end

  add_index "events", ["manager_id"], name: "index_events_on_manager_id"

  create_table "lines", force: :cascade do |t|
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "status"
    t.boolean  "already_start"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "next_checkin_time"
    t.integer  "number_of_fake_user"
    t.integer  "min_score"
    t.integer  "max_score"
    t.integer  "event_id"
  end

  add_index "lines", ["event_id"], name: "index_lines_on_event_id"

  create_table "managers", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
  end

  add_index "managers", ["email"], name: "index_managers_on_email", unique: true
  add_index "managers", ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_and_lines_relationships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "line_id"
    t.integer  "score",                              default: 0
    t.integer  "position",                           default: 0
    t.integer  "checkin_count",                      default: 0
    t.integer  "continuous_checkin_count",           default: 0
    t.integer  "delta_value",                        default: 0
    t.integer  "missed_checkin_count",               default: 0
    t.boolean  "checkin_current_period",             default: false
    t.boolean  "first_try",                          default: false
    t.boolean  "robot",                              default: false
    t.boolean  "send_period_notification",           default: true
    t.datetime "send_notification_time",             default: '2015-05-25 02:52:10'
    t.datetime "deadline_receive_notification_time", default: '2015-05-25 02:52:10'
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
  end

  add_index "users_and_lines_relationships", ["line_id"], name: "index_users_and_lines_relationships_on_line_id"
  add_index "users_and_lines_relationships", ["user_id"], name: "index_users_and_lines_relationships_on_user_id"

  create_table "users_attend_events_relationships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users_attend_events_relationships", ["event_id"], name: "index_users_attend_events_relationships_on_event_id"
  add_index "users_attend_events_relationships", ["user_id"], name: "index_users_attend_events_relationships_on_user_id"

  create_table "users_favorite_events_relationships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users_favorite_events_relationships", ["event_id"], name: "index_users_favorite_events_relationships_on_event_id"
  add_index "users_favorite_events_relationships", ["user_id"], name: "index_users_favorite_events_relationships_on_user_id"

end
