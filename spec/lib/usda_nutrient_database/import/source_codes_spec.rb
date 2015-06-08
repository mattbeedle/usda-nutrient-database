require 'spec_helper'

describe UsdaNutrientDatabase::Import::SourceCodes do
  let(:importer) { described_class.new('spec/support/sr27') }

  describe '#import' do
    before { importer.import }

    it { expect(UsdaNutrientDatabase::SourceCode.count).to eql(10) }
  end
end
