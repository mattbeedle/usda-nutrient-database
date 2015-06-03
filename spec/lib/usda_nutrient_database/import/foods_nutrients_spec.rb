require 'spec_helper'

describe UsdaNutrientDatabase::Import::FoodsNutrients do
  let(:importer) { described_class.new('spec/support/sr27') }

  describe '#import' do
    before { importer.import }

    it do
      expect(UsdaNutrientDatabase::FoodsNutrient.count).to eql(5)
    end
  end
end
