ActiveRecord::Schema.define(version: 20160201014634) do

  create_table "shoe_brands", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shoe_brands_stores", id: false, force: :cascade do |t|
    t.integer "shoe_brand_id", limit: 4, null: false
    t.integer "shoe_store_id", limit: 4, null: false
  end

  create_table "shoe_stores", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end
end
