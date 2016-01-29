class ShoeBrand < ActiveRecord::Base
  before_save :capitalized
  validates :name, :presence => true
  
  def capitalized
    self.name = self.name.downcase.titleize
  end
end
