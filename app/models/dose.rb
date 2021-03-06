class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  validates :description, presence: true
  validates :ingredient_id, presence: true
  validates :cocktail_id, presence: true
  validates_uniqueness_of :ingredient, scope: :cocktail
end
