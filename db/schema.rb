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

ActiveRecord::Schema.define(version: 20160423043835) do

  create_table "lines", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer  "post_id"
    t.text     "line_text",  limit: 65535
    t.integer  "count",                    default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at"
  end

  create_table "poem_lines", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci" do |t|
    t.integer  "poem_id"
    t.integer  "line_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at"
  end

  add_index "poem_lines", ["poem_id"], name: "poem_id", using: :btree

  create_table "poems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", primary_key: "post_id", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string   "link",      limit: 80
    t.datetime "timestamp",            default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "shared", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci" do |t|
    t.integer  "poem_id",                                                    null: false
    t.string   "type",       limit: 20,                                      null: false
    t.datetime "timestamp",             default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "ip_address", limit: 45
  end

  add_index "shared", ["poem_id"], name: "poem_id", using: :btree

end
