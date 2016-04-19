require 'spec_helper'

describe UsdaNutrientDatabase::FoodsNutrient, type: :model do
  it { should validate_presence_of(:nutrient_databank_number) }
  it { should validate_presence_of(:nutrient_number) }
  it { should validate_presence_of(:nutrient_value) }
  it { should validate_presence_of(:num_data_points) }
  it { should validate_presence_of(:src_code) }
end