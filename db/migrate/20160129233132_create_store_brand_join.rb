class CreateStoreBrandJoin < ActiveRecord::Migration
  def change
    create_join_table :shoe_brands, :shoe_stores do |t|
      t.index [:shoe_brand_id, :shoe_store_id]
      t.index [:shoe_store_id, :shoe_brand_id]
    end
  end
end
