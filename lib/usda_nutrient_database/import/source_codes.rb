module UsdaNutrientDatabase
  module Import
    class SourceCodes < Base

      private

      def find_or_initialize(row)
        UsdaNutrientDatabase::SourceCode.find_or_initialize_by(code: row[0])
      end

      def columns
        [:code, :description]
      end

      def log_import_started
        UsdaNutrientDatabase.log 'Import source codes'
      end

      def filename
        'SRC_CD.txt'
      end

      def save_objects
        UsdaNutrientDatabase::SourceCode.import(columns, objects_to_import, {
          validate: false,
          on_duplicate_key_update: {
            conflict_target: :code,
            columns: columns
          }
        })
      end
    end
  end
end
