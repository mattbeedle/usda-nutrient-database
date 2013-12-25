module UsdaNutrientDatabase
  module Import
    class Weights < Base

      private

      def extract_row(row)
        build_weight(row).save
      end

      def build_weight(row)
        UsdaNutrientDatabase::Weight.new.tap do |weight|
          columns.each_with_index do |column, index|
            weight.send("#{column}=", row[index])
          end
        end
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
    end
  end
end
