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

ActiveRecord::Schema.define(version: 20170526102401) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
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

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

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

  create_table "dailyworks", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.date     "date",       null: false
    t.float    "workstart",  null: false
    t.float    "workend",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "breaktime1"
    t.float    "breaktime2"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "groupname",                      null: false
    t.date     "groupstartdate"
    t.date     "groupenddate"
    t.boolean  "groupstatus",    default: false, null: false
    t.text     "groupdetail"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "grouptasks", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "task_id",  null: false
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
    t.integer  "group1_id"
    t.integer  "group2_id"
    t.integer  "group3_id"
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
    t.text     "comment"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
