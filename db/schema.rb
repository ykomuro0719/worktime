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

ActiveRecord::Schema.define(version: 20170511023447) do

  create_table "child1tasks", force: :cascade do |t|
    t.string  "child1title",                     null: false
    t.boolean "child1status",    default: false, null: false
    t.date    "child1startdate"
    t.date    "child1enddate"
  end

  create_table "child2tasks", force: :cascade do |t|
    t.string  "child2title",                     null: false
    t.boolean "child2status",    default: false, null: false
    t.date    "child2startdate"
    t.date    "child2enddate"
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
    t.string  "requesttitle",                     null: false
    t.boolean "requeststatus",    default: false, null: false
    t.date    "requeststartdate"
    t.date    "requestenddate"
  end

  create_table "selectchild1s", force: :cascade do |t|
    t.integer "task_id"
    t.integer "child1task_id"
  end

  create_table "selectchild2s", force: :cascade do |t|
    t.integer "child1task_id"
    t.integer "child2task_id"
  end

  create_table "selectrequests", force: :cascade do |t|
    t.integer "task_id"
    t.integer "request_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string  "tasktitle",                     null: false
    t.boolean "taskstatus",    default: false, null: false
    t.date    "taskstartdate"
    t.date    "taskenddate"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name",                                   null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false, null: false
    t.integer  "eid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "works", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "date"
    t.float    "work_time"
    t.integer  "task_id"
    t.integer  "child1task_id"
    t.integer  "child2task_id"
    t.integer  "request_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
