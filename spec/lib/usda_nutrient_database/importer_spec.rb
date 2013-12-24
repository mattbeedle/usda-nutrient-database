require 'spec_helper'

describe UsdaNutrientDatabase::Importer do
  let(:importer) { described_class.new }

  describe '#import' do
    before do
      stub_request(:get, /.*/).
        to_return(body: File.read('spec/support/sr25.zip'))
      importer.import
    end
  end

  it { expect(UsdaNutrientDatabase::FoodGroup.count).to eql(10) }
end