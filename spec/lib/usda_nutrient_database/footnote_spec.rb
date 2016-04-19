require 'spec_helper'

describe UsdaNutrientDatabase::Footnote, type: :model do
  it 'validates uniqueness of nutrient_databank_number' do
    expect(subject)
      .to validate_uniqueness_of(:nutrient_databank_number)
      .scoped_to(:footnote_number, :nutrient_number)
  end
  it { is_expected.to validate_presence_of(:footnote_number) }
  it { is_expected.to validate_presence_of(:footnote_type) }
  it { is_expected.to validate_presence_of(:footnote_text) }
end