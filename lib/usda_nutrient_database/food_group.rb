module UsdaNutrientDatabase
  class FoodGroup < ActiveRecord::Base
    self.table_name = 'usda_food_groups'
    self.primary_key = 'code'

    validates :code, presence: true, uniqueness: { allow_blank: true }
    validates :description, presence: true

    has_many :foods, class_name: 'UsdaNutrientDatabase::Food',
      dependent: :destroy
  end
end