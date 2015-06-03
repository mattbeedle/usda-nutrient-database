require 'spec_helper'

describe UsdaNutrientDatabase::Import::Nutrients do
  let(:importer) { described_class.new('spec/support/sr27') }

  describe '#import' do
    before { importer.import }

    it { expect(UsdaNutrientDatabase::Nutrient.count).to eql(3) }
  end
end