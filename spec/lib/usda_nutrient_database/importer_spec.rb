require 'spec_helper'

describe UsdaNutrientDatabase::Importer do
  let(:importer) { UsdaNutrientDatabase::Importer.new }

  describe '#import (sr25)' do
    let(:sr_file) { File.read('spec/support/sr25.zip') }
    before do
      stub_request(:head, "https://www.ars.usda.gov/SP2UserFiles/Place/12354500/Data/SR25/dnload/sr25.zip").
        to_return(:status => 200, :body => "", :headers => {})
      stub_request(:get, /.*/).
        to_return(body: sr_file)
      importer.import
    end

    it 'should import the right number of records' do
      expect(UsdaNutrientDatabase::FoodGroup.count).to eql(25)
      expect(UsdaNutrientDatabase::Food.count).to eql(16)
      expect(UsdaNutrientDatabase::Nutrient.count).to eql(15)
      expect(UsdaNutrientDatabase::FoodsNutrient.count).to eql(12)
      expect(UsdaNutrientDatabase::Weight.count).to eql(11)
      expect(UsdaNutrientDatabase::Footnote.count).to eql(9)
    end

    # NOTE Not sure how this one got past code review o.O. Need to clean up both
    # the zip files in spec support to only have a few records and remove the
    # PDF. Don't want people having to download megabytes of useless spec
    # support files just to install this gem.
    context 'with sr27' do
      let(:sr_file) { File.read('spec/support/sr27.zip') }
      it 'should import the right number of records' do
        expect(UsdaNutrientDatabase::FoodGroup.count).to eql(25)
        expect(UsdaNutrientDatabase::Food.count).to eql(5)
        expect(UsdaNutrientDatabase::Nutrient.count).to eql(150)
        expect(UsdaNutrientDatabase::FoodsNutrient.count).to eql(476)
        expect(UsdaNutrientDatabase::Weight.count).to eql(18)
        expect(UsdaNutrientDatabase::Footnote.count).to eql(531)
      end
    end

    context 'importing twice' do
      before { importer.import }

      it 'should import the right number of records' do
        expect(UsdaNutrientDatabase::FoodGroup.count).to eql(25)
        expect(UsdaNutrientDatabase::Food.count).to eql(16)
        expect(UsdaNutrientDatabase::Nutrient.count).to eql(15)
        expect(UsdaNutrientDatabase::FoodsNutrient.count).to eql(12)
        expect(UsdaNutrientDatabase::Weight.count).to eql(11)
        expect(UsdaNutrientDatabase::Footnote.count).to eql(9)
      end
    end
  end
end
