class CreateShoeBrands < ActiveRecord::Migration
  def change
    create_table :shoe_brands do |t|
      t.string :name

      t.timestamps
    end
  end
end
