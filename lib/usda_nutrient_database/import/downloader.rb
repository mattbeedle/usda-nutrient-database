require 'zip'

module UsdaNutrientDatabase
  module Import
    class Downloader

      attr_reader :directory, :version

      def initialize(directory = 'tmp/usda', version = UsdaNutrientDatabase.usda_version)
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
          'SP2UserFiles',
          'Place',
          '12354500',
          'Data',
          version == 'sr28' ? 'SR' : nil,
          version.upcase,
          'dnload',
          "#{version_file}.zip"
        ].compact.join('/')
      end

      def download
        UsdaNutrientDatabase.log "Downloading USDA data version: #{version}"
        unless File.directory?(directory)
          FileUtils.mkdir_p("#{directory}/#{version}")
        end
        File.open("#{directory}/#{version}.zip", 'w+b') do |file|
          file.write connection.get(final_path).body
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
        @connection ||= Faraday.new(url: 'https://www.ars.usda.gov')
      end

      def final_path
        look_ahead = connection.head(path)
        if look_ahead.status == 302
          raise 'No location' unless look_ahead.headers['location']
          URI.parse(look_ahead.headers['location']).path
        else
          path
        end
      end

      def version_file
        case @version
        when 'sr27'
          'sr27asc'
        when 'sr28'
          'sr28asc'
        else
          @version
        end
      end
    end
  end
end
