module UsdaNutrientDatabase
  module Import
    class FoodsNutrients < Base
      def import
        CSV.open("#{directory}/NUT_DATA.txt", 'r', csv_options) do |csv|
          csv.each { |row| extract_row(row) }
        end
      end

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
        attrs = {}
        columns.each_with_index do |column, index|
          attrs.merge!(column => row[index])
        end
        UsdaNutrientDatabase::FoodsNutrient.create!(attrs)
      end
    end
  end
end
