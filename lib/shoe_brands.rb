class ShoeBrand < ActiveRecord::Base
  has_and_belongs_to_many :shoe_stores
  before_save :capitalized
  validates :name, :presence => true

  #Todo
  # def instore(shoe_store_id)
  #   shoestore = ShoeStore.find(shoe_store_id)
  #   if self.shoe_stores(shoestore) == ActiveRecord::RecordNotFound
  #     return nil
  #   else
  #     return self.shoe_stores(shoestore)
  #   end
  # end

  def capitalized
    self.name = self.name.downcase.titleize
  end
end
