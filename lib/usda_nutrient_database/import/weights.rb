module UsdaNutrientDatabase
  module Import
    class Weights < Base
      def import
        CSV.open(
          "#{directory}/WEIGHT.txt", 'r:iso-8859-1:utf-8', csv_options
        ) do |csv|
          csv.each do |row|
            UsdaNutrientDatabase::Weight.create!(
              nutrient_databank_number: row[0],
              sequence_number: row[1], amount: row[2],
              measurement_description: row[3], gram_weight: row[4],
              num_data_points: row[5], standard_deviation: row[6]
            )
          end
        end
      end
    end
  end
end
