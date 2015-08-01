module UsdaNutrientDatabase
  class FoodsNutrient < ActiveRecord::Base
    self.table_name = 'usda_foods_nutrients'

    validates :nutrient_databank_number, presence: true,
      uniqueness: { scope: :nutrient_number, allow_blank: true }
    validates :nutrient_number, presence: true,
      uniqueness: { scope: :nutrient_databank_number, allow_blank: true }
    validates :nutrient_value, presence: true
    validates :num_data_points, presence: true
    validates :src_code, presence: true

    belongs_to :food, class_name: 'UsdaNutrientDatabase::Food',
      foreign_key: :nutrient_databank_number
    belongs_to :nutrient, class_name: 'UsdaNutrientDatabase::Nutrient',
      foreign_key: :nutrient_number

    scope :by_nutrient_databank_number, ->(nutrient_databank_number) {
      where(nutrient_databank_number: nutrient_databank_number)
    }
    scope :by_nutrient_number, ->(nutrient_number) {
      where(nutrient_number: nutrient_number)
    }
  end
end
