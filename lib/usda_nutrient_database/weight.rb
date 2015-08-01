module UsdaNutrientDatabase
  class Weight < ActiveRecord::Base
    self.table_name = 'usda_weights'

    validates :nutrient_databank_number, presence: true,
      uniqueness: { scope: :sequence_number }
    validates :sequence_number, presence: true,
      uniqueness: { scope: :nutrient_databank_number }
    validates :amount, presence: true
    validates :measurement_description, presence: true
    validates :gram_weight, presence: true

    belongs_to :food, class_name: 'UsdaNutrientDatabase::Food',
      foreign_key: :nutrient_databank_number

    scope :by_nutrient_databank_number, ->(nutrient_databank_number) {
      where(nutrient_databank_number: nutrient_databank_number)
    }
  end
end