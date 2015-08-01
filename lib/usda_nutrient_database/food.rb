module UsdaNutrientDatabase
  class Food < ActiveRecord::Base
    self.table_name = 'usda_foods'
    self.primary_key = 'nutrient_databank_number'

    validates :nutrient_databank_number, presence: true,
      uniqueness: { allow_blank: true }
    validates :food_group_code, presence: true
    validates :long_description, presence: true
    validates :short_description, presence: true

    has_many :footnotes, class_name: 'UsdaNutrientDatabase::Footnote',
      foreign_key: :nutrient_databank_number
    has_many :weights, class_name: 'UsdaNutrientDatabase::Weight',
      foreign_key: :nutrient_databank_number
    has_many :foods_nutrients,
      class_name: 'UsdaNutrientDatabase::FoodsNutrient',
      foreign_key: :nutrient_databank_number, dependent: :nullify
    has_many :nutrients, class_name: 'UsdaNutrientDatabase::Nutrient',
      through: :foods_nutrients

    belongs_to :food_group, class_name: 'UsdaNutrientDatabase::FoodGroup',
      foreign_key: :food_group_code

    scope :by_nutrient_number, ->(nutrient_number) {
      joins(:nutrients)
        .where(nutrients: { nutrient_number: nutrient_number })
    }
  end
end
