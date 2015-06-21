require 'csv'

module UsdaNutrientDatabase
  module Import
    class Base
      def initialize(directory)
        @directory = directory
      end

      def import
        log_import_started
        CSV.open(file_location, 'r:iso-8859-1:utf-8', csv_options) do |csv|
          csv.each { |row| extract_row(row) }
        end
      end

      private

      attr_reader :directory

      def extract_row(row)
        build_object(apply_typecasts(row)).save
      end

      def build_object(row)
        find_or_initialize(row).tap do |object|
          columns.each_with_index do |column, index|
            object.send("#{column}=", row[index])
          end
        end
      end

      def columns
        raise NotImplementedError
      end

      def find_or_initialize(row)
        raise NotImplementedError
      end

      def apply_typecasts(row)
        row
      end

      def file_location
        "#{directory}/#{filename}"
      end

      def filename
        raise NotImplementedError
      end

      def csv_options
        { col_sep: '^', quote_char: '~' }
      end
    end
  end
end
