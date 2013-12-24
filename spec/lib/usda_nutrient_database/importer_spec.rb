require 'spec_helper'

describe UsdaNutrientDatabase::Importer do
  let(:importer) { UsdaNutrientDatabase::Importer.new }

  describe '#import' do
    before do
      stub_request(:get, /.*/).
        to_return(body: File.read('spec/support/sr25.zip'))
      importer.import
    end

    it { expect(UsdaNutrientDatabase::FoodGroup.count).to eql(25) }
    it { expect(UsdaNutrientDatabase::Food.count).to eql(16) }
    it { expect(UsdaNutrientDatabase::Nutrient.count).to eql(15) }
    it { expect(UsdaNutrientDatabase::FoodsNutrient.count).to eql(12) }
    it { expect(UsdaNutrientDatabase::Weight.count).to eql(11) }
  end
end