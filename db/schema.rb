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

ActiveRecord::Schema.define(version: 20150424044834) do

  create_table "events", force: :cascade do |t|
    t.string   "name",           null: false
    t.integer  "max_attendance", null: false
    t.datetime "start_time",     null: false
    t.datetime "create_time",    null: false
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "fake_users", force: :cascade do |t|
    t.string   "phone_number",             null: false
    t.integer  "lives",                    null: false
    t.integer  "position",                 null: false
    t.integer  "score",                    null: false
    t.integer  "checkin_count",            null: false
    t.integer  "continuous_checkin_count", null: false
    t.integer  "missed_checkin_count",     null: false
    t.integer  "delta_value",              null: false
    t.boolean  "checkin_current_period",   null: false
    t.boolean  "first_try",                null: false
    t.boolean  "robot",                    null: false
    t.datetime "send_notification_time",   null: false
    t.string   "notification_option",      null: false
    t.boolean  "send_notification",        null: false
    t.datetime "notification_deadline",    null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "lines", force: :cascade do |t|
    t.string   "status",              null: false
    t.boolean  "already_start",       null: false
    t.datetime "start_time",          null: false
    t.datetime "end_time",            null: false
    t.datetime "next_checkin_time",   null: false
    t.integer  "number_of_fake_user", null: false
    t.integer  "min_score",           null: false
    t.integer  "max_score",           null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "phone_number",                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
