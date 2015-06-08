require 'csv'

module UsdaNutrientDatabase
  module Import
    class Base
      def initialize(directory)
        @directory = directory
      end

      def import
        log_import_started
        import_with_postgres? ? import_postgresql : import_csv
      end

      def import_postgresql
        sql = <<-SQL
          COPY #{klass.table_name} (#{columns.map(&:to_s).join(', ')})
            FROM '#{Pathname.new(Dir.pwd).join(file_location)}'
            DELIMITER '^' QUOTE '~' CSV
        SQL

        ActiveRecord::Base.connection.execute "DELETE FROM #{klass.table_name}"
        ActiveRecord::Base.connection.execute sql
      end

      def import_csv
        CSV.open(file_location, 'r:iso-8859-1:utf-8', csv_options) do |csv|
          csv.each { |row| extract_row(row) }
        end
      end

      def import_with_postgres?
        ActiveRecord::Base.connection_config[:adapter] == "postgresql"
      end

      private

      attr_reader :directory

      def extract_row(row)
        build_object(row).save
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

      def klass
        raise NotImplementedError
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
