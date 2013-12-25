module UsdaNutrientDatabase
  module Import
    class FoodsNutrients < Base

      private

      def columns
        [
          :nutrient_databank_number, :nutrient_number, :nutrient_value,
          :num_data_points, :standard_error, :src_code, :derivation_code,
          :ref_nutrient_databank_number, :add_nutrient_mark, :num_studies, :min,
          :max, :degrees_of_freedom, :lower_error_bound, :upper_error_bound,
          :statistical_comments, :add_mod_date
        ]
      end

      def extract_row(row)
        build_foods_nutrient(row).save
      end

      def build_foods_nutrient(row)
        UsdaNutrientDatabase::FoodsNutrient.new.tap do |foods_nutrient|
          columns.each_with_index do |column, index|
            foods_nutrient.send("#{column}=", row[index])
          end
        end
      end

      def filename
        'NUT_DATA.txt'
      end

      def log_import_started
        UsdaNutrientDatabase.log 'Importing foods_nutrients'
      end
    end
  end
end
