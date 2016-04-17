module UsdaNutrientDatabase
  module Import
    class FoodsNutrients < Base

      private

      def apply_typecasts(row)
        row[8] = row[8] == 'Y'
        row
      end

      def columns
        [
          :nutrient_databank_number, :nutrient_number, :nutrient_value,
          :num_data_points, :standard_error, :src_code, :derivation_code,
          :ref_nutrient_databank_number, :add_nutrient_mark, :num_studies, :min,
          :max, :degrees_of_freedom, :lower_error_bound, :upper_error_bound,
          :statistical_comments, :add_mod_date
        ]
      end

      def find_or_initialize(row)
        UsdaNutrientDatabase::FoodsNutrient.new(
          nutrient_databank_number: row[0],
          nutrient_number: row[3]
        )
      end

      def filename
        'NUT_DATA.txt'
      end

      def log_import_started
        UsdaNutrientDatabase.log 'Importing foods_nutrients'
      end

      def save_objects
        options = {
          batch_size: UsdaNutrientDatabase.batch_size,
          validate: false
        }
        if UsdaNutrientDatabase::FoodsNutrient.exists?
          options.merge!(
            on_duplicate_key_update: {
              conflict_target: %i(nutrient_databank_number nutrient_number),
              columns: columns
            }
          )
        end
        UsdaNutrientDatabase::FoodsNutrient.import(
          columns,
          objects_to_import,
          options
        )
      end
    end
  end
end
