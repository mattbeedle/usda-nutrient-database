module UsdaNutrientDatabase
  module Import
    class Nutrients < Base

      private

      def klass
        UsdaNutrientDatabase::Nutrient
      end

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

      def import_with_postgres?
        false
      end

      def log_import_started
        UsdaNutrientDatabase.log 'Importing nutrients'
      end
    end
  end
end
