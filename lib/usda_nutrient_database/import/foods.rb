# encoding: utf-8

module UsdaNutrientDatabase
  module Import
    class Foods < Base

      private

      def extract_row(row)
        build_food(row).save
      end

      def build_food(row)
        UsdaNutrientDatabase::Food.new.tap do |food|
          columns.each_with_index do |column, index|
            food.send("#{column}=", row[index])
          end
        end
      end

      def log_import_started
        UsdaNutrientDatabase.log 'Importing foods'
      end

      def filename
        'FOOD_DES.txt'
      end

      def columns
        [
          :nutrient_databank_number, :food_group_code, :long_description,
          :short_description, :common_names, :manufacturer_name, :survey,
          :refuse_description, :percentage_refuse, :nitrogen_factor,
          :protein_factor, :fat_factor, :carbohydrate_factor
        ]
      end
    end
  end
end
