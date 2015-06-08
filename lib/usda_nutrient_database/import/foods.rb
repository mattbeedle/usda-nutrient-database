# encoding: utf-8

module UsdaNutrientDatabase
  module Import
    class Foods < Base

      private

      def klass
        UsdaNutrientDatabase::Food
      end

      def find_or_initialize(row)
        UsdaNutrientDatabase::Food.
          find_or_initialize_by(nutrient_databank_number: row[0])
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
          :short_description, :common_names, :manufacturer_name, :survey_text,
          :refuse_description, :percentage_refuse, :scientific_name,
          :nitrogen_factor, :protein_factor, :fat_factor,
          :carbohydrate_factor
        ]
      end
    end
  end
end
