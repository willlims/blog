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

ActiveRecord::Schema.define(version: 20160710024229) do

  create_table "articles", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "text",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "user_details", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "name",       limit: 255
    t.string   "value",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_features", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "name",       limit: 255
    t.boolean  "switch"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "phone",      limit: 255
    t.string   "password",   limit: 255
    t.integer  "version",    limit: 4
    t.string   "open_id",    limit: 255
    t.string   "token",      limit: 255
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_delete",              default: false
    t.integer  "origin",     limit: 4
  end

  create_table "wechat_platforms", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wechats", force: :cascade do |t|
    t.string   "nickname",       limit: 255
    t.string   "string",         limit: 255
    t.string   "head_image_url", limit: 255
    t.string   "sex",            limit: 255
    t.string   "subscribe",      limit: 255
    t.string   "open_id",        limit: 255
    t.string   "city",           limit: 255
    t.string   "country",        limit: 255
    t.string   "province",       limit: 255
    t.string   "language",       limit: 255
    t.string   "subscribe_time", limit: 255
    t.string   "datetime",       limit: 255
    t.string   "union_id",       limit: 255
    t.string   "remark",         limit: 255
    t.string   "deleted",        limit: 255
    t.string   "boolean",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end