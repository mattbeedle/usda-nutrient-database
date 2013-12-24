module UsdaNutrientDatabase
  class FoodGroup < ActiveRecord::Base
    self.table_name = 'usda_food_groups'

    validates :code, presence: true, uniqueness: { allow_blank: true }
    validates :description, presence: true

    has_many :foods, class_name: 'UsdaNutrientDatabase::Food',
      dependent: :destroy
  end
end