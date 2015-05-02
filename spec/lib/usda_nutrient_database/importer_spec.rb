require 'spec_helper'

describe UsdaNutrientDatabase::Importer do
  let(:importer) { UsdaNutrientDatabase::Importer.new }

  describe '#import (sr25)' do
    let(:sr_file) { File.read('spec/support/sr25.zip') }
    before do
      stub_request(:head, "https://www.ars.usda.gov/SP2UserFiles/Place/12354500/Data/SR25/dnload/sr25.zip").
        with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Faraday v0.9.1'}).
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
      expect(UsdaNutrientDatabase::Footnote.count).to eql(7)
    end

    context 'with sr27' do
      let(:sr_file) { File.read('spec/support/sr27.zip') }
      it 'should import the right number of records' do
        expect(UsdaNutrientDatabase::FoodGroup.count).to eql(25)
        expect(UsdaNutrientDatabase::Food.count).to eql(5)
        expect(UsdaNutrientDatabase::Nutrient.count).to eql(150)
        expect(UsdaNutrientDatabase::FoodsNutrient.count).to eql(476)
        expect(UsdaNutrientDatabase::Weight.count).to eql(18)
        expect(UsdaNutrientDatabase::Footnote.count).to eql(362)
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
        expect(UsdaNutrientDatabase::Footnote.count).to eql(7)
      end
    end
  end
end
