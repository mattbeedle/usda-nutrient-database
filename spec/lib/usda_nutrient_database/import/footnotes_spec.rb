require 'spec_helper'

describe UsdaNutrientDatabase::Import::Footnotes do
  let(:importer) { described_class.new('spec/support/sr27') }

  describe '#import' do
    before { importer.import }

    it { expect(UsdaNutrientDatabase::Footnote.count).to eql(4) }
  end
end