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

ActiveRecord::Schema.define(version: 20160129233132) do

  create_table "shoe_brands", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shoe_brands_stores", id: false, force: :cascade do |t|
    t.integer "shoe_brand_id", limit: 4, null: false
    t.integer "shoe_store_id", limit: 4, null: false
  end

  add_index "shoe_brands_stores", ["shoe_brand_id", "shoe_store_id"], name: "index_shoe_brands_stores_on_shoe_brand_id_and_shoe_store_id", using: :btree
  add_index "shoe_brands_stores", ["shoe_store_id", "shoe_brand_id"], name: "index_shoe_brands_stores_on_shoe_store_id_and_shoe_brand_id", using: :btree

  create_table "shoe_stores", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
