require 'spec_helper'

describe UsdaNutrientDatabase::Footnote do
  it { should validate_presence_of(:nutrient_databank_number) }
  it { should validate_presence_of(:footnote_number) }
  it { should validate_presence_of(:footnote_type) }
  it { should validate_presence_of(:footnote_text) }
end