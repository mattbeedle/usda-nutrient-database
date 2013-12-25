module UsdaNutrientDatabase
  module Import
    class Nutrients < Base

      private

      def extract_row(row)
        build_nutrient(row).save
      end

      def build_nutrient(row)
        UsdaNutrientDatabase::Nutrient.new.tap do |nutrient|
          columns.each_with_index do |column, index|
            nutrient.send("#{column}=", row[index])
          end
        end
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
    end
  end
end
