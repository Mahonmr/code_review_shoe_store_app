class ShoeStore < ActiveRecord::Base
  before_save :capitalized

  def capitalized
    self.name = self.name.downcase.titleize
  end
end
