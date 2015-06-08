module UsdaNutrientDatabase
  module Import
    class SourceCodes < Base

      private

      def klass
        UsdaNutrientDatabase::SourceCode
      end

      def find_or_initialize(row)
        UsdaNutrientDatabase::SourceCode.find_or_initialize_by(code: row[0])
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
