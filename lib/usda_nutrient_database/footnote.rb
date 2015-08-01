module UsdaNutrientDatabase
  class Footnote < ActiveRecord::Base
    self.table_name = 'usda_footnotes'

    validates :nutrient_databank_number, presence: true,
      uniqueness: { allow_blank: true }
    validates :footnote_number, presence: true
    validates :footnote_type, presence: true
    validates :footnote_text, presence: true

    belongs_to :food, class_name: 'UsdaNutrientDatabase::Food',
      foreign_key: :nutrient_databank_number
    belongs_to :nutrient, class_name: 'UsdaNutrientDatabase::Nutrient',
      foreign_key: :nutrient_number

    scope :by_nutrient_number, ->(nutrient_number) {
      where(nutrient_number: nutrient_number)
    }
  end
end
