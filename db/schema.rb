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

ActiveRecord::Schema.define(version: 20170430013912) do

  create_table "child1_tasks", force: :cascade do |t|
    t.string "child1Title"
  end

  create_table "child2_tasks", force: :cascade do |t|
    t.string "child2Title"
  end

  create_table "installs", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "installs", ["email"], name: "index_installs_on_email", unique: true
  add_index "installs", ["reset_password_token"], name: "index_installs_on_reset_password_token", unique: true

  create_table "requests", force: :cascade do |t|
    t.string "requestTitle"
  end

  create_table "select_child1s", force: :cascade do |t|
    t.integer "task_id"
    t.integer "taskIndex"
    t.integer "child1_id"
  end

  create_table "select_child2s", force: :cascade do |t|
    t.integer "child1_id"
    t.integer "child1Index"
    t.integer "child2_id"
  end

  create_table "select_requests", force: :cascade do |t|
    t.integer "task_id"
    t.integer "taskIndex"
    t.integer "request_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "taskTitle"
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "works", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "date"
    t.string   "work"
    t.float    "work_time"
    t.integer  "task_id"
    t.integer  "child1Task_id"
    t.integer  "child2Task_id"
    t.integer  "request_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
