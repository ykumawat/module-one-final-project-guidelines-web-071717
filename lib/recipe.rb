class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  serialize :category, Array

  def self.all_categories
    self.all.map { |rec| rec.category }
  end
end
