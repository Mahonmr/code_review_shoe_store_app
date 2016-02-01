class CreateJointableShoesStores < ActiveRecord::Migration
  def change
    create_join_table :shoe_brands, :shoe_stores do |t|
      # t.index [:shoe_brands_id, :shoe_stores_id]
      # t.index [:shoe_stores_id, :shoe_brands_id]
    end
  end
end
