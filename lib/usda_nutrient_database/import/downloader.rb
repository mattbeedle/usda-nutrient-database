require 'zip'

module UsdaNutrientDatabase
  module Import
    class Downloader

      attr_reader :directory, :version

      def initialize(directory = 'tmp/usda', version = 'sr25')
        @directory = directory
        @version = version
      end

      def cleanup
        UsdaNutrientDatabase.log 'Cleaning up data'
        FileUtils.rm_rf(directory)
      end

      def download_and_unzip
        download and unzip
      end

      def path
        [
          'SP2UserFiles', 'Place', '12354500', 'Data', version.upcase,
          'dnload', "#{version}.zip"
        ].join('/')
      end

      def download
        UsdaNutrientDatabase.log "Downloading USDA data version: #{version}"
        unless File.directory?(directory)
          FileUtils.mkdir_p("#{directory}/#{version}")
        end
        File.open("#{directory}/#{version}.zip", 'w+b') do |file|
          file.write connection.get(path).body
        end
      end

      def unzip
        UsdaNutrientDatabase.log 'Unzipping data'
        Zip::File.open("#{directory}/#{version}.zip") do |zipfile|
          zipfile.each do |file|
            unless File.exist?("#{directory}/#{version}/#{file.name}")
              zipfile.extract(file, "#{directory}/#{version}/#{file.name}")
            end
          end
        end
      end

      def connection
        @connection ||= Faraday.new(url: 'http://www.ars.usda.gov')
      end
    end
  end
end
