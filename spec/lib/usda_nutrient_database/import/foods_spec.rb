require 'spec_helper'

describe UsdaNutrientDatabase::Import::Foods do
  let(:importer) { described_class.new('spec/support/sr25') }

  describe '#import' do
    before { importer.import }

    it { expect(UsdaNutrientDatabase::Food.count).to eql(4) }

    it do
      expect(UsdaNutrientDatabase::Food.where(food_group_code: '0100').count).
        to eql(3)
    end
  end
end
