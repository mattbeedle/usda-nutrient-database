require 'csv'

module UsdaNutrientDatabase
  module Import
    class Base
      attr_reader :directory

      def initialize(directory)
        @directory = directory
      end

      def import
        log_import_started
        CSV.open(
          "#{directory}/#{filename}", 'r:iso-8859-1:utf-8', csv_options
        ) do |csv|
          csv.each { |row| extract_row(row) }
        end
      end

      private

      def filename
        raise NotImplementedError
      end

      def csv_options
        { col_sep: '^', quote_char: '~' }
      end
    end
  end
end
