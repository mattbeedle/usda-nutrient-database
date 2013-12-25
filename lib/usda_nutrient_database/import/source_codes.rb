module UsdaNutrientDatabase
  module Import
    class SourceCodes < Base

      private

      def extract_row(row)
        build_source_code(row).save
      end

      def build_source_code(row)
        UsdaNutrientDatabase::SourceCode.new.tap do |source_code|
          columns.each_with_index do |column, index|
            source_code.send("#{column}=", row[index])
          end
        end
      end

      def columns
        [:code, :description]
      end

      def log_import_started
        UsdaNutrientDatabase.log 'Source code import started'
      end

      def filename
        'SRC_CD.txt'
      end
    end
  end
end
