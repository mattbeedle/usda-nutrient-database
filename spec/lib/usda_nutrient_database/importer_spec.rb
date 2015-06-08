require 'spec_helper'

describe UsdaNutrientDatabase::Importer do
  let(:importer) { UsdaNutrientDatabase::Importer.new }

  describe '#import' do
    before do
      stub_request(:get, /.*/).
        to_return(body: File.read('spec/support/sr27asc.zip'))
      importer.import
    end

    it { expect(UsdaNutrientDatabase::FoodGroup.count).to eql(2) }
    it { expect(UsdaNutrientDatabase::Food.count).to eql(4) }
    it { expect(UsdaNutrientDatabase::Nutrient.count).to eql(3) }
    it { expect(UsdaNutrientDatabase::FoodsNutrient.count).to eql(5) }
    it { expect(UsdaNutrientDatabase::Weight.count).to eql(3) }
    it { expect(UsdaNutrientDatabase::Footnote.count).to eql(4) }

    context 'importing twice' do
      before { importer.import }

      it { expect(UsdaNutrientDatabase::FoodGroup.count).to eql(2) }
      it { expect(UsdaNutrientDatabase::Food.count).to eql(4) }
      it { expect(UsdaNutrientDatabase::Nutrient.count).to eql(3) }
      it { expect(UsdaNutrientDatabase::FoodsNutrient.count).to eql(5) }
      it { expect(UsdaNutrientDatabase::Weight.count).to eql(3) }
      it { expect(UsdaNutrientDatabase::Footnote.count).to eql(4) }
    end
  end
end