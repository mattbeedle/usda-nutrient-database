require 'spec_helper'

describe UsdaNutrientDatabase::Import::Downloader do
  let(:downloader) { described_class.new('tmp/usda') }
  let(:extraction_path) { "#{directory}/#{version}" }
  let(:directory) { 'tmp/usda' }
  let(:version) { 'sr27' }
  let(:filenames) do
    [
      'DATA_SRC.txt', 'DATSRCLN.txt', 'DERIV_CD.txt', 'FD_GROUP.txt',
      'FOOD_DES.txt', 'FOOTNOTE.txt', 'LANGDESC.txt', 'LANGUAL.txt',
      'NUTR_DEF.txt', 'NUT_DATA.txt', 'SRC_CD.txt', 'WEIGHT.txt', 'sr27_doc.pdf'
    ]
  end

  describe '#download_and_unzip' do
    before do
      stub_request(:get, /.*/).
        to_return(body: File.read('spec/support/sr27asc.zip'))
      downloader.download_and_unzip
    end

    after { downloader.cleanup }

    it 'should download and extract all files' do
      filenames.each do |filename|
        puts filename
        expect(File.exist?("#{extraction_path}/#{filename}")).to eql(true)
      end
    end
  end

  describe '#cleanup' do
    before do
      stub_request(:get, /.*/).
        to_return(body: File.read('spec/support/sr27asc.zip'))
      downloader.download_and_unzip
      downloader.cleanup
    end

    it 'should remove all of the extracted files' do
      filenames.each do |filename|
        expect(File.exist?("#{extraction_path}/#{filename}")).to eql(false)
      end
    end
  end
end
