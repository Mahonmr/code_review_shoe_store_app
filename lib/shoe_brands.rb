class ShoeBrand < ActiveRecord::Base
  has_and_belongs_to_many :shoe_stores
  before_save :capitalized
  validates :name, :presence => true

  def instore(shoe_store_id)
    shoestore = ShoeStore.find(shoe_store_id)
    self.shoe_stores.find_by_name(shoestore.name)
  end

  def capitalized
    self.name = self.name.downcase.titleize
  end
end
