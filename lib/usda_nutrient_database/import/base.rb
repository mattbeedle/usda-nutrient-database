require 'csv'

module UsdaNutrientDatabase
  module Import
    class Base
      def initialize(directory)
        @directory = directory
        @objects_to_import = []
      end

      def import
        log_import_started
        CSV.open(file_location, 'r:iso-8859-1:utf-8', csv_options) do |csv|
          csv.each { |row| objects_to_import << extract_row(row) }
        end
        ar_import? ? save_objects : objects_to_import.each(&:save)
      end

      private

      attr_reader :directory,
        :objects_to_import

      def ar_import?
        UsdaNutrientDatabase.activerecord_import?
      end

      def extract_row(row)
        build_object(apply_typecasts(row))
      end

      def build_object(row)
        ar_import? ? build_values_array(row) : build_ar_object(row)
      end

      def build_ar_object(row)
        find_or_initialize(row).tap do |object|
          columns.each_with_index do |column, index|
            object.send("#{column}=", row[index])
          end
        end
      end

      def build_values_array(row)
        columns.map.with_index { |_, index| row[index] }
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

      def save_objects
        raise NotImplementedError
      end
    end
  end
end
