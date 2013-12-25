module UsdaNutrientDatabase
  class SourceCode < ActiveRecord::Base
    self.table_name = 'usda_source_codes'

    validates :code, presence: true, uniqueness: { allow_blank: true }
    validates :description, presence: true
  end
end