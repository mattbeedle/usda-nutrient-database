module UsdaNutrientDatabase
  class Food < ActiveRecord::Base
    self.table_name = 'usda_foods'
    self.primary_key = 'nutrient_databank_number'

    validates :nutrient_databank_number, presence: true,
      uniqueness: { allow_blank: true }
    validates :food_group_code, presence: true
    validates :long_description, presence: true
    validates :short_description, presence: true

    has_many :footnotes, class_name: 'UsdaNutrientDatabase::Footnote'

    belongs_to :food_group, class_name: 'UsdaNutrientDatabase::FoodGroup',
      foreign_key: :food_group_code
  end
end
