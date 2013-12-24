require 'spec_helper'

describe UsdaNutrientDatabase::Import::Weights do
  let(:importer) { described_class.new('spec/support/sr25') }

  describe '#import' do
    before { importer.import }

    it { expect(UsdaNutrientDatabase::Weight.count).to eql(3) }
  end
end