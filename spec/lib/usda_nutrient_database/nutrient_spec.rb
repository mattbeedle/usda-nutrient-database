require 'spec_helper'

describe UsdaNutrientDatabase::Nutrient, type: :model do
  it { should validate_presence_of(:nutrient_number) }
  it { should validate_presence_of(:units) }
  it { should validate_presence_of(:nutrient_description) }
  it { should validate_presence_of(:number_decimal_places) }
  it { should validate_presence_of(:sort_record_order) }
  it { should validate_numericality_of(:sort_record_order) }
end
