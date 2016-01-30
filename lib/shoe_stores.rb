class ShoeStore < ActiveRecord::Base
  has_and_belongs_to_many :shoe_brands
  before_save :capitalized
  validates :name, :presence => true

  def capitalized
    self.name = self.name.downcase.titleize
  end

  def self.join_shoe_brand(shoe_store_id, shoe_brand_id)
    shoestore = ShoeStore.find(shoe_store_id)
    shoebrand = ShoeBrand.find(shoe_brand_id)
    shoestore.shoe_brands << shoebrand
  end
  #
  # def self.delete_shoe_brand(shoe_store_id, shoe_brand_id)
  # end
end


# post('/recipes/:recipe_id/tags') do
#   recipe = Recipe.find(params[:recipe_id].to_i)
#   tag = Tag.find(params[:tag_id].to_i)
#   recipe.tags << tag
#   redirect('/recipes')
# end
#
# delete('/recipes/:recipe_id/tags/:tag_id') do
#   recipe = Recipe.find(params[:recipe_id].to_i)
#   tag = Tag.find(params[:tag_id].to_i)
#   recipe.tags.delete(tag)
#   redirect ("/recipes/#{params[:recipe_id].to_i}")
# end
