module UsdaNutrientDatabase
  module Import
    class Weights < Base

      private

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

      def log_import_started
        UsdaNutrientDatabase.log 'Importing weights'
      end

      def save_objects
        UsdaNutrientDatabase::Weight.import(columns, objects_to_import, {
          validate: false,
          on_duplicate_key_update: {
            conflict_target: %i(nutrient_databank_number sequence_number),
            columns: columns
          }
        })
      end
    end
  end
end
