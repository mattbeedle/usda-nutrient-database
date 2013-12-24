require 'spec_helper'

describe UsdaNutrientDatabase::Food do
  it { should validate_presence_of(:nutrient_databank_number) }
  it { should validate_presence_of(:food_group_code) }
  it { should validate_presence_of(:long_description) }
  it { should validate_presence_of(:short_description) }
end