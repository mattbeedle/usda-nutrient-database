module UsdaNutrientDatabase
  module Import
    class FoodGroups < Base

      private

      def find_or_initialize(row)
        UsdaNutrientDatabase::FoodGroup.find_or_initialize_by(code: row[0])
      end

      def columns
        @columns ||= %w(code description)
      end

      def filename
        'FD_GROUP.txt'
      end

      def log_import_started
        UsdaNutrientDatabase.log 'Importing food groups'
      end

      def save_objects
        UsdaNutrientDatabase::FoodGroup.import(columns, objects_to_import, {
          validate: false,
          on_duplicate_key_update: {
            conflict_target: :code,
            columns: %i(description)
          }
        })
      end
    end
  end
end
