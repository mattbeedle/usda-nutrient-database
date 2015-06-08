module UsdaNutrientDatabase
  module Import
    class Weights < Base

      private

      def klass
        UsdaNutrientDatabase::Weight
      end

      def find_or_initialize(row)
        UsdaNutrientDatabase::Weight.find_or_initialize_by(
          nutrient_databank_number: row[0],
          sequence_number: row[1]
        )
      end

      def filename
        'WEIGHT.txt'
      end

      def columns
        @columns ||= [
          :nutrient_databank_number, :sequence_number, :amount,
          :measurement_description, :gram_weight, :num_data_points,
          :standard_deviation
        ]
      end

      def import_with_postgres?
        false
      end

      def log_import_started
        UsdaNutrientDatabase.log 'Importing weights'
      end
    end
  end
end
