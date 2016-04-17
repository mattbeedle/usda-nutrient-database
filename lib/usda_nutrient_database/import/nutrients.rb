module UsdaNutrientDatabase
  module Import
    class Nutrients < Base

      private

      def find_or_initialize(row)
        UsdaNutrientDatabase::Nutrient.
          find_or_initialize_by(nutrient_number: row[0])
      end

      def columns
        @columns ||= [
          :nutrient_number, :units, :tagname, :nutrient_description,
          :number_decimal_places, :sort_record_order
        ]
      end

      def filename
        'NUTR_DEF.txt'
      end

      def log_import_started
        UsdaNutrientDatabase.log 'Importing nutrients'
      end

      def save_objects
        UsdaNutrientDatabase::Nutrient.import(columns, objects_to_import, {
          validate: false,
          on_duplicate_key_update: {
            conflict_target: :nutrient_number,
            columns: columns
          }
        })
      end
    end
  end
end
