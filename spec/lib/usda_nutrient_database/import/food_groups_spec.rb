require 'spec_helper'

describe UsdaNutrientDatabase::Import::FoodGroups do
  let(:importer) { described_class.new('spec/support/sr27') }

  describe '#import' do
    before { importer.import }

    it 'should import all food groups' do
      expect(UsdaNutrientDatabase::FoodGroup.count).to eql(2)
    end

    it 'should import food group data correctly' do
      [
        { code: '0100', description: 'Dairy and Egg Products' },
        { code: '0200', description: 'Spices and Herbs' }
      ].each do |product|
        expect(
          UsdaNutrientDatabase::FoodGroup.
          where(code: product[:code], description: product[:description]).count
        ).to eql(1)
      end
    end
  end
end
