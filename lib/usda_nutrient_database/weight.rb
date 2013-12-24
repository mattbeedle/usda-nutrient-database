module UsdaNutrientDatabase
  class Weight < ActiveRecord::Base
    self.table_name = 'usda_weights'

    validates :nutrient_databank_number, presence: true
    validates :sequence_number, presence: true
    validates :amount, presence: true
    validates :measurement_description, presence: true
    validates :gram_weight, presence: true
  end
end