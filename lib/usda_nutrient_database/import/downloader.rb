module UsdaNutrientDatabase
  module Import
    class Downloader

      attr_reader :directory

      def initialize(directory = 'tmp/usda')
        @directory = directory
      end

      def cleanup
        FileUtils.rm_rf(directory)
      end

      def download_and_unzip
        FileUtils.mkdir(directory)
        `curl http://www.ars.usda.gov/SP2UserFiles/Place/12354500/Data/SR25/dnload/sr25.zip > #{directory}/sr25.zip`
        Zip::File.open('tmp/sr25.zip') do |zipfile|
          zipfile.each do |file|
            zipfile.extract(file)
          end
        end
      end
    end
  end
end
