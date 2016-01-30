class ShoeBrand < ActiveRecord::Base
  has_and_belongs_to_many :shoe_stores
  before_save :capitalized
  validates :name, :presence => true

  def capitalized
    self.name = self.name.downcase.titleize
  end
end
