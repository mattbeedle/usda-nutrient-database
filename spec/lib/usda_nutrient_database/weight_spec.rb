require 'spec_helper'

describe UsdaNutrientDatabase::Weight do
  it { should validate_presence_of(:nutrient_databank_number) }
  it { should validate_presence_of(:sequence_number) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:measurement_description) }
  it { should validate_presence_of(:gram_weight) }
end
